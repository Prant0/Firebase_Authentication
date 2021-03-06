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
    apiKey: 'AIzaSyB5c6ormphZDE9f1Y9x5Xtuumu6I6tbSmA',
    appId: '1:177361152122:web:e2f88a8842d01fa7f1f3c3',
    messagingSenderId: '177361152122',
    projectId: 'firebaes-flutter-auth',
    authDomain: 'firebaes-flutter-auth.firebaseapp.com',
    storageBucket: 'firebaes-flutter-auth.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCU0DX8tuxnkrDweIzM5qSQVKezb22Rakg',
    appId: '1:177361152122:android:17d0b21bbce52ed4f1f3c3',
    messagingSenderId: '177361152122',
    projectId: 'firebaes-flutter-auth',
    storageBucket: 'firebaes-flutter-auth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxBrpjbRR6fP4gMYla2fQrWPVlODryECQ',
    appId: '1:177361152122:ios:81a5befa9a88735df1f3c3',
    messagingSenderId: '177361152122',
    projectId: 'firebaes-flutter-auth',
    storageBucket: 'firebaes-flutter-auth.appspot.com',
    iosClientId: '177361152122-ntfc2kis2915u6tmtsbi06eu28o8136l.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthAll',
  );
}
