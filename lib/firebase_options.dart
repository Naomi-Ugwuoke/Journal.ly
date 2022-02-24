// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA-V41bnYAk-APqi9LUvMPS2Uhh2QCJyV0',
    appId: '1:352269718646:web:df9c28c25c8bba4f403b57',
    messagingSenderId: '352269718646',
    projectId: 'the-bug-chasers',
    authDomain: 'the-bug-chasers.firebaseapp.com',
    storageBucket: 'the-bug-chasers.appspot.com',
    measurementId: 'G-YX3M9LLD7B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDh7a5IqvtuMJ-0gRZF4lhLTYhYVjedy4Q',
    appId: '1:352269718646:android:2a4016d55adc026e403b57',
    messagingSenderId: '352269718646',
    projectId: 'the-bug-chasers',
    storageBucket: 'the-bug-chasers.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7HG3O0MwHjfUp_OFkG9JnRlqTFpExW5Y',
    appId: '1:352269718646:ios:63b66f840884dbf6403b57',
    messagingSenderId: '352269718646',
    projectId: 'the-bug-chasers',
    storageBucket: 'the-bug-chasers.appspot.com',
    iosClientId: '352269718646-srheiusn8if6baola3de3t5j0l491lqg.apps.googleusercontent.com',
    iosBundleId: 'com.example.theBugChasers',
  );
}
