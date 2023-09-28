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
    apiKey: 'AIzaSyB6Ei6l3xbrsussb4NzGUaeKcUOuEgqIHs',
    appId: '1:828306497382:web:f66f8cbb35d64a60f832a7',
    messagingSenderId: '828306497382',
    projectId: 'buddeeup-80d95',
    authDomain: 'buddeeup-80d95.firebaseapp.com',
    storageBucket: 'buddeeup-80d95.appspot.com',
    measurementId: 'G-WLBJPS21GY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBD4PYiiPTCX7S7MRLOoQ3ipPbNJvaUkvU',
    appId: '1:828306497382:android:55af2a622358d8ccf832a7',
    messagingSenderId: '828306497382',
    projectId: 'buddeeup-80d95',
    storageBucket: 'buddeeup-80d95.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-RIiEx5r7CBdm7rz01nCr-4C8KzZJHIk',
    appId: '1:828306497382:ios:15638dc0a3b64adaf832a7',
    messagingSenderId: '828306497382',
    projectId: 'buddeeup-80d95',
    storageBucket: 'buddeeup-80d95.appspot.com',
    iosBundleId: 'com.example.buddeeUp',
  );
}