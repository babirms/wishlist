import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  final DateTime createdAt;
  final String name;
  final String email;
  final String password;
  final String id;

  UserEntity({
    required this.createdAt,
    required this.name,
    required this.email,
    required this.password,
    required this.id,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
