import 'package:wishlist/features/products/data/datasources/product_remote_datasource.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';

class ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepository(this.productRemoteDataSource);

  Future<List<ProductEntity>> getAllProducts() async {
    return productRemoteDataSource.getAllProducts();
  }
}
