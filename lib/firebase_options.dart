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
    apiKey: 'AIzaSyDC4R3FM65ayAtD8f4gRMujHKKgV-j2pKA',
    appId: '1:755098186285:web:2c8f80b3d04317197d3ea4',
    messagingSenderId: '755098186285',
    projectId: 'eccatapp',
    authDomain: 'eccatapp.firebaseapp.com',
    storageBucket: 'eccatapp.appspot.com',
    measurementId: 'G-X8EJLWHNVJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqSw_H9QZAmkZdZSGz8koJvAiKz4UBx6E',
    appId: '1:755098186285:android:92d892f8c40ae9a37d3ea4',
    messagingSenderId: '755098186285',
    projectId: 'eccatapp',
    storageBucket: 'eccatapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNzIQNLfrzFGlE2FVTNMphHBbNYGIegqU',
    appId: '1:755098186285:ios:75b9d334ae8152627d3ea4',
    messagingSenderId: '755098186285',
    projectId: 'eccatapp',
    storageBucket: 'eccatapp.appspot.com',
    iosBundleId: 'com.example.eccatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNzIQNLfrzFGlE2FVTNMphHBbNYGIegqU',
    appId: '1:755098186285:ios:ace35174453f03dd7d3ea4',
    messagingSenderId: '755098186285',
    projectId: 'eccatapp',
    storageBucket: 'eccatapp.appspot.com',
    iosBundleId: 'com.example.eccatapp.RunnerTests',
  );
}
