// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCXvjDP8PzpIxQfTtNfn-8kFREXHyXzrPc',
    appId: '1:1032915521626:web:ce75d1ba5afb9f0c57c863',
    messagingSenderId: '1032915521626',
    projectId: 'wishlist-cabcd',
    authDomain: 'wishlist-cabcd.firebaseapp.com',
    storageBucket: 'wishlist-cabcd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB72GqZJYcCoc2DwOhBXQzqeFRFmYhf4Mw',
    appId: '1:1032915521626:android:94920b3f9c1fdfa457c863',
    messagingSenderId: '1032915521626',
    projectId: 'wishlist-cabcd',
    storageBucket: 'wishlist-cabcd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCh3ad0SJzbMcBLscDW4lnQ_gmOQZs5QWw',
    appId: '1:1032915521626:ios:542c4da4e976b5fc57c863',
    messagingSenderId: '1032915521626',
    projectId: 'wishlist-cabcd',
    storageBucket: 'wishlist-cabcd.appspot.com',
    iosBundleId: 'com.example.wishlist',
  );

}