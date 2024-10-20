import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';

class ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSource({required this.sharedPreferences});

  static const _productsList = 'local_products_list';

  Future<List<ProductEntity>?> getLocalProductsList() async {
    final localProductsJson = sharedPreferences.getString(_productsList);

    /// Caso exista uma lista de produtos salva localmente
    if (localProductsJson != null) {
      /// Recupera o json do cache
      final List<dynamic> productsListMap = jsonDecode(localProductsJson);

      /// Converte e retorna como uma lista de [ProductEntity]
      return productsListMap
          .map((product) => ProductEntity.fromJson(product))
          .toList();
    }

    /// Caso não exista uma lista de produtos salva localmente, retorna null
    return null;
  }

  Future<void> saveLocalProductsList(
      {required List<ProductEntity> productsList}) async {
    try {
      /// Converte a lista de [ProductEntity]
      final List<Map<String, dynamic>> productsListMap =
          productsList.map((product) => product.toJson()).toList();
      final String productsJson = jsonEncode(productsListMap);

      /// Salva o json localmente
      await sharedPreferences.setString(_productsList, productsJson);
    } catch (e) {
      throw Exception('Erro ao salvar a lista de produtos localmente: $e');
    }
  }

  Future<void> clearProductsList() async =>
      await sharedPreferences.remove(_productsList);
}
