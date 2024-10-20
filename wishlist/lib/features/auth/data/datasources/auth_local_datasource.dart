import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wishlist/features/auth/data/entities/user_entity.dart';

class AuthLocalDatasource {
  final SharedPreferences sharedPreferences;

  AuthLocalDatasource({required this.sharedPreferences});

  static const _userKey = 'local_user';

  Future<UserEntity?> getLocalUser() async {
    final localUserJson = sharedPreferences.getString(_userKey);

    /// Caso exista um usuário salvo localmente
    if (localUserJson != null) {
      /// Recupera o json do cache
      final Map<String, dynamic> userMap = jsonDecode(localUserJson);

      /// Converte e retorna como [UserEntity]
      return UserEntity.fromJson(userMap);
    }

    /// Caso não exista um usuário salvo localmente, retorna [null]
    return null;
  }

  Future<void> saveLocalUser({required UserEntity user}) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await sharedPreferences.setString(_userKey, userJson);
    } catch (e) {
      throw Exception('Erro ao salvar o usuário localmente: $e');
    }
  }

  Future<void> clearUser() async => await sharedPreferences.remove(_userKey);
}
