import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  final Timestamp createdAt;
  final String name;
  final String email;
  final String id;

  UserEntity({
    required this.createdAt,
    required this.name,
    required this.email,
    required this.id,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      createdAt: json['createdAt'] is String
          ? Timestamp.fromDate(DateTime.parse(json['createdAt']))
          : json['createdAt'] as Timestamp,
      name: json['name'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt.toDate().toIso8601String(),
        'name': name,
        'email': email,
        'id': id,
      };
}
