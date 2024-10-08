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
    apiKey: 'AIzaSyDEdVzhWcQA5k59OlC3z1FmRoiP3EcMhUo',
    appId: '1:530107834672:web:4ee084224569c1b18ba8f5',
    messagingSenderId: '530107834672',
    projectId: 'prov-3cee0',
    authDomain: 'prov-3cee0.firebaseapp.com',
    storageBucket: 'prov-3cee0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDftVxWouArtbhMRLGSIoA0VQPql4_AD7c',
    appId: '1:530107834672:android:d1d9eda426c596c38ba8f5',
    messagingSenderId: '530107834672',
    projectId: 'prov-3cee0',
    storageBucket: 'prov-3cee0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDj30iAa6hVpEkprJHKHETuYpIFOnAxayU',
    appId: '1:530107834672:ios:7eac5139dfaf22ff8ba8f5',
    messagingSenderId: '530107834672',
    projectId: 'prov-3cee0',
    storageBucket: 'prov-3cee0.appspot.com',
    iosBundleId: 'com.example.providerHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDj30iAa6hVpEkprJHKHETuYpIFOnAxayU',
    appId: '1:530107834672:ios:7eac5139dfaf22ff8ba8f5',
    messagingSenderId: '530107834672',
    projectId: 'prov-3cee0',
    storageBucket: 'prov-3cee0.appspot.com',
    iosBundleId: 'com.example.providerHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEdVzhWcQA5k59OlC3z1FmRoiP3EcMhUo',
    appId: '1:530107834672:web:8dfdf245086b73948ba8f5',
    messagingSenderId: '530107834672',
    projectId: 'prov-3cee0',
    authDomain: 'prov-3cee0.firebaseapp.com',
    storageBucket: 'prov-3cee0.appspot.com',
  );
}
