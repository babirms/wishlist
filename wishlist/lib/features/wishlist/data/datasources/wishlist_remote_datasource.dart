import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';

class WishlistRemoteDataSource {
  final FirebaseFirestore firestore;

  WishlistRemoteDataSource({required this.firestore});

  Future<WishlistEntity> getWishlistFromUserId({required String userId}) async {
    try {
      final wishlists = await firestore
          .collection('wishlist')
          .where('userId', isEqualTo: userId)
          .get();

      if (wishlists.docs.isNotEmpty) {
        return WishlistEntity.fromJson(wishlists.docs.first.data());
      } else {
        return await createWishlist(userId: userId);
      }
    } catch (e) {
      throw Exception('Erro ao buscar a wishlist: $e');
    }
  }

  Future<WishlistEntity> createWishlist(
      {required String userId, List<ProductEntity>? productList}) async {
    try {
      /// Cria um documento vazio no firestore
      final doc = await firestore.collection('wishlist').add({});

      /// Cria a wishlist como [WishlistEntity]
      final wishlist = WishlistEntity(
          userId: userId, productList: productList ?? [], id: doc.id);

      /// Atualiza o documento com uma wishlist no Firestore
      await updateWishlist(wishlist: wishlist);

      return wishlist;
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
