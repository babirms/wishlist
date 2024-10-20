import 'package:wishlist/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:wishlist/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:wishlist/features/auth/data/entities/user_entity.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDatasource localDatasource;

  AuthRepository({
    required this.remoteDataSource,
    required this.localDatasource,
  });

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    return await remoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
  }

  Future<UserEntity> login(
      {required String email, required String password}) async {
    final success = await remoteDataSource.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (success) {
      final user = await remoteDataSource.getUserByEmail(email);
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
    return await remoteDataSource.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    return await remoteDataSource.logout();
  }

  Future<UserEntity?> getLocalUser() async {
    return await localDatasource.getLocalUser();
  }
}
