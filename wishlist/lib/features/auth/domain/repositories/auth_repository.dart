import 'package:wishlist/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:wishlist/features/auth/data/entities/user_entity.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepository({required this.authRemoteDataSource});

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    return await authRemoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
  }

  Future<UserEntity> login(
      {required String email, required String password}) async {
    final success = await authRemoteDataSource.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (success) {
      final user = await authRemoteDataSource.getUserByEmail(email);
      if (user != null) {
        return user;
      } else {
        throw Exception('Usuário não existente na base');
      }
    } else {
      throw Exception('Erro ao fazer login');
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    return await authRemoteDataSource.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    return await authRemoteDataSource.logout();
  }
}
