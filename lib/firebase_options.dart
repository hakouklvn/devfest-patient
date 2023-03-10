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
    apiKey: 'AIzaSyA4qPX92i0gm3VN30TTYuYpn5etZ-5KdnI',
    appId: '1:865571598171:web:24f16a2ed586499a59747e',
    messagingSenderId: '865571598171',
    projectId: 'devfest-dd826',
    authDomain: 'devfest-dd826.firebaseapp.com',
    storageBucket: 'devfest-dd826.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgS2JSpR9zYWWdVzQ-8c0BSOpkKgN7pIY',
    appId: '1:865571598171:android:e17c71799599b0c559747e',
    messagingSenderId: '865571598171',
    projectId: 'devfest-dd826',
    storageBucket: 'devfest-dd826.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzh61Le3P3oAkrFAa2IfyoIAi1JwUG2RQ',
    appId: '1:865571598171:ios:301a76213909b42459747e',
    messagingSenderId: '865571598171',
    projectId: 'devfest-dd826',
    storageBucket: 'devfest-dd826.appspot.com',
    iosClientId: '865571598171-9h0mio728tj7toqkjli3qi7futct2d60.apps.googleusercontent.com',
    iosBundleId: 'com.example.patient',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzh61Le3P3oAkrFAa2IfyoIAi1JwUG2RQ',
    appId: '1:865571598171:ios:301a76213909b42459747e',
    messagingSenderId: '865571598171',
    projectId: 'devfest-dd826',
    storageBucket: 'devfest-dd826.appspot.com',
    iosClientId: '865571598171-9h0mio728tj7toqkjli3qi7futct2d60.apps.googleusercontent.com',
    iosBundleId: 'com.example.patient',
  );
}
