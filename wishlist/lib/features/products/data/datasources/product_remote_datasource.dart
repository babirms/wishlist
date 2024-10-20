import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wishlist/features/products/data/datasources/product_local_datasource.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/data/datasources/wishlist_remote_datasource.dart';

class ProductRemoteDataSource {
  final FirebaseFirestore firestore;
  final WishlistRemoteDataSource wishlistRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;

  ProductRemoteDataSource({
    required this.firestore,
    required this.wishlistRemoteDataSource,
    required this.productLocalDataSource,
  });

  Future<List<ProductEntity>> getAllProducts() async {
    try {
      /// Verifica se existe uma lista de produtos salva localmente
      final localProductsList =
          await productLocalDataSource.getLocalProductsList();

      /// Caso exista, retorna ela
      if (localProductsList != null) {
        return localProductsList;
      }

      /// Caso não, recupera todos os produtos da base e os salva localmente
      else {
        QuerySnapshot querySnapshot =
            await firestore.collection('products').get();

        final convertedProductsList = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ProductEntity.fromJson(data);
        }).toList();

        await productLocalDataSource.saveLocalProductsList(
            productsList: convertedProductsList);

        return convertedProductsList;
      }
    } catch (e) {
      throw Exception('Erro ao recuperar a lista de produtos: $e');
    }
  }
}
