import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wishlist/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:wishlist/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/products/data/datasources/product_remote_datasource.dart';
import 'package:wishlist/features/products/domain/repositories/product_repository.dart';
import 'package:wishlist/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
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

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    /// Fluxo de autenticação
    _sl.registerSingleton<AuthLocalDatasource>(
        AuthLocalDatasource(sharedPreferences: sharedPreferences));

    _sl.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
        localDatasource: _sl(),
      ),
    );
    _sl.registerSingleton<AuthRepository>(
      AuthRepository(
        remoteDataSource: _sl(),
        localDatasource: _sl(),
      ),
    );

    /// Produtos
    _sl.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSource(firestore: firestore),
    );
    _sl.registerSingleton<ProductRepository>(
      ProductRepository(productRemoteDataSource: _sl()),
    );

    /// Lista de desejos
    _sl.registerSingleton<WishlistRemoteDataSource>(
      WishlistRemoteDataSource(firestore: firestore),
    );
  }
}
