import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';

class WishlistRemoteDataSource {
  final FirebaseFirestore firestore;

  WishlistRemoteDataSource({required this.firestore});

  Future<WishlistEntity?> getWishlistFromUserId(
      {required String userId}) async {
    try {
      final wishlist = await firestore.collection('wishlist').doc(userId).get();

      if (wishlist.exists) {
        return WishlistEntity.fromJson(wishlist.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Erro ao buscar a wishlist: $e');
    }
  }

  Future<void> createWishlist(
      {required String userId, List<ProductEntity>? productList}) async {
    try {
      /// Cria um documento vazio no firestore
      final doc = await firestore.collection('wishlist').add({});

      /// Atualiza o documento com uma wishlist no Firestore
      await updateWishlist(
          wishlist: WishlistEntity(
              userId: userId, productList: productList ?? [], id: doc.id));
    } catch (e) {
      throw Exception('Erro ao atualizar a wishlist: $e');
    }
  }

  Future<void> updateWishlist({required WishlistEntity wishlist}) async {
    try {
      await firestore
          .collection('wishlist')
          .doc(wishlist.id)
          .set(wishlist.toJson());
    } catch (e) {
      throw Exception('Erro ao atualizar a wishlist: $e');
    }
  }
}
