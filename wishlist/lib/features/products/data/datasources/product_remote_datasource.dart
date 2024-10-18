import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';

class ProductRemoteDataSource {
  final FirebaseFirestore _firestore;

  ProductRemoteDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<List<ProductEntity>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('products').get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ProductEntity.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Erro ao recuperar a lista de produtos: $e');
    }
  }
}
