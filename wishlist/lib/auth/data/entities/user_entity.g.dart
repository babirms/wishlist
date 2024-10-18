// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'id': instance.id,
    };
