import 'package:wishlist/features/products/data/entities/product_entity.dart';

class WishlistEntity {
  final String userId;
  final List<ProductEntity> productList;
  final String? id;

  WishlistEntity({
    this.id,
    required this.userId,
    required this.productList,
  });

  factory WishlistEntity.fromJson(Map<String, dynamic> json) {
    return WishlistEntity(
      id: json['id'],
      userId: json['userId'],
      productList: List<ProductEntity>.from(json['productList']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productList': productList,
    };
  }
}
