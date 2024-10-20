import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wishlist/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:wishlist/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/products/data/datasources/product_local_datasource.dart';
import 'package:wishlist/features/products/data/datasources/product_remote_datasource.dart';
import 'package:wishlist/features/products/domain/repositories/product_repository.dart';
import 'package:wishlist/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';
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

    /// Cache
    _sl.registerSingleton<ProductLocalDataSource>(
      ProductLocalDataSource(sharedPreferences: sharedPreferences),
    );

    _sl.registerSingleton<AuthLocalDatasource>(
        AuthLocalDatasource(sharedPreferences: sharedPreferences));

    /// Remote Datasource
    _sl.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
        localDatasource: _sl(),
        productLocalDataSource: _sl(),
      ),
    );

    _sl.registerSingleton<WishlistRemoteDataSource>(
      WishlistRemoteDataSource(firestore: firestore),
    );

    _sl.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSource(
        firestore: firestore,
        wishlistRemoteDataSource: _sl(),
        productLocalDataSource: _sl(),
      ),
    );

    /// Repository
    _sl.registerSingleton<AuthRepository>(
      AuthRepository(
        remoteDataSource: _sl(),
        localDatasource: _sl(),
      ),
    );

    _sl.registerSingleton<ProductRepository>(
      ProductRepository(productRemoteDataSource: _sl()),
    );

    _sl.registerSingleton<WishlistRepository>(
      WishlistRepository(remoteDataSource: _sl()),
    );
  }
}
