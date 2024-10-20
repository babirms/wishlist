import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:wishlist/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:wishlist/features/auth/data/entities/user_entity.dart';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final AuthLocalDatasource localDatasource;

  AuthRemoteDataSource({
    required this.firebaseAuth,
    required this.firestore,
    required this.localDatasource,
  });

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      /// Cria o usuário no [FirebaseAuth]
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        /// Converte o usuário do [FirebaseAuth] para [UserEntity]
        final user = UserEntity(
            createdAt: Timestamp.now(),
            name: name,
            email: email,
            id: userCredential.user!.uid);

        /// Cria o usuário no [Firestore]
        await firestore.collection('users').doc(user.id).set(user.toJson());

        /// Salva o usuário localmente
        await localDatasource.saveLocalUser(user: user);
      }
    } catch (e) {
      throw Exception('Erro ao criar usuário: $e');
    }
  }

  Future<bool> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      /// Recupera o usuário do [FirebaseAuth]
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Recupera o usuário do [Firestore]
      final currentUser = await getUserByEmail(email);

      /// Caso seja recuperado um usuário com sucesso
      if (currentUser != null) {
        /// Salva o usuário localmente
        await localDatasource.saveLocalUser(user: currentUser);
      }

      /// Caso o usuário esteja cadastrado no [FirebaseAuth], mas não esteja no [Firestore]
      /// ocorreu um erro no processo de cadastro
      else {
        throw Exception('Erro ao fazer login: Usuário não encontrado na base');
      }
      return userCredential.user != null;
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Erro ao enviar e-mail de recuperação de senha: $e');
    }
  }

  Future<UserEntity?> getUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;

        return UserEntity.fromJson(userData);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Erro ao buscar usuário pelo email: $e');
    }
  }

  Future<void> logout() async {
    try {
      /// Sai do [FirebaseAuth]
      await firebaseAuth.signOut();

      /// Remove o usuário do cache
      await localDatasource.clearUser();
    } catch (e) {
      throw Exception('Erro ao realizar o logout: $e');
    }
  }
}
