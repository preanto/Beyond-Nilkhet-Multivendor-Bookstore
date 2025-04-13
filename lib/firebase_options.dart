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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBrSkYVrl9RIMNvgU8_q90ojz3G5GgZw2o',
    appId: '1:335337286968:web:5a95db1f6248366dd3e5cd',
    messagingSenderId: '335337286968',
    projectId: 'beyond-nilkhet',
    authDomain: 'beyond-nilkhet.firebaseapp.com',
    storageBucket: 'beyond-nilkhet.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuOEby2y2LLb7Vnju7tSJLQjpVGmwoIpE',
    appId: '1:335337286968:android:deb59f0ed9ffe10fd3e5cd',
    messagingSenderId: '335337286968',
    projectId: 'beyond-nilkhet',
    storageBucket: 'beyond-nilkhet.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGxkmzui1oxqt1sIBKgDOWVcxKorYnVGw',
    appId: '1:335337286968:ios:2ae8120f62d0d5a9d3e5cd',
    messagingSenderId: '335337286968',
    projectId: 'beyond-nilkhet',
    storageBucket: 'beyond-nilkhet.firebasestorage.app',
    iosBundleId: 'com.example.emartApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGxkmzui1oxqt1sIBKgDOWVcxKorYnVGw',
    appId: '1:335337286968:ios:2ae8120f62d0d5a9d3e5cd',
    messagingSenderId: '335337286968',
    projectId: 'beyond-nilkhet',
    storageBucket: 'beyond-nilkhet.firebasestorage.app',
    iosBundleId: 'com.example.emartApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBrSkYVrl9RIMNvgU8_q90ojz3G5GgZw2o',
    appId: '1:335337286968:web:c48d84fbd7843bafd3e5cd',
    messagingSenderId: '335337286968',
    projectId: 'beyond-nilkhet',
    authDomain: 'beyond-nilkhet.firebaseapp.com',
    storageBucket: 'beyond-nilkhet.firebasestorage.app',
  );
}
