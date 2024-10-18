import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  final String id;
  final String name;
  final String description;
  final String image;
  final Timestamp createdAt;

  ProductEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.createdAt});

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      createdAt: json['createdAt'],
      name: json['name'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'name': name,
        'description': description,
        'id': id,
        'image': image,
      };
}
