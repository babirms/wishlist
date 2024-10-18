import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:wishlist/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/firebase_options.dart';

final _sl = GetIt.instance;

mixin Sl {
  static GetIt get instance => _sl;

  static T get<T extends Object>() => Sl.instance.get<T>();

  static FirebaseFirestore get firestore => FirebaseFirestore.instance;

  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _sl.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
      ),
    );
    _sl.registerSingleton<AuthRepository>(
      AuthRepository(authRemoteDataSource: _sl()),
    );
  }
}
