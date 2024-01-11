// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyDdMEffT81Xtq2Taq_BYzEK4JkSIfdW67g',
    appId: '1:422196741485:web:fb423f34b6df9946cb0664',
    messagingSenderId: '422196741485',
    projectId: 'web3freelancer-dev',
    authDomain: 'web3freelancer-dev.firebaseapp.com',
    storageBucket: 'web3freelancer-dev.appspot.com',
    measurementId: 'G-YPBY2BV5GP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8XoH8DSx-mBwXUlO1CInd_w5WfGab1cw',
    appId: '1:422196741485:android:dcf8f1bc4242cd2ecb0664',
    messagingSenderId: '422196741485',
    projectId: 'web3freelancer-dev',
    storageBucket: 'web3freelancer-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLiLSveZ7VVdVQuNPQUhj_4mfZxzagvQI',
    appId: '1:422196741485:ios:34fc560c3107bc8fcb0664',
    messagingSenderId: '422196741485',
    projectId: 'web3freelancer-dev',
    storageBucket: 'web3freelancer-dev.appspot.com',
    iosBundleId: 'com.visionDev.web3Freelancer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLiLSveZ7VVdVQuNPQUhj_4mfZxzagvQI',
    appId: '1:422196741485:ios:496d16b5ad9edfa0cb0664',
    messagingSenderId: '422196741485',
    projectId: 'web3freelancer-dev',
    storageBucket: 'web3freelancer-dev.appspot.com',
    iosBundleId: 'com.visionDev.web3Freelancer.RunnerTests',
  );
}