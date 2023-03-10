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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGeO7DAkJdPIT7ceyT_x71FJvKrcEZuo8',
    appId: '1:644152924206:android:e9932acdbf753d4d9c67bf',
    messagingSenderId: '644152924206',
    projectId: 'otp-testing-5033f',
    storageBucket: 'otp-testing-5033f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAG_wfWpP55zF-sWmgmUu-NO7FeqqSTha0',
    appId: '1:644152924206:ios:fc6eba200188da6d9c67bf',
    messagingSenderId: '644152924206',
    projectId: 'otp-testing-5033f',
    storageBucket: 'otp-testing-5033f.appspot.com',
    androidClientId: '644152924206-b95rhuoqmcmfg68tu3apmjog7l9h6ln4.apps.googleusercontent.com',
    iosClientId: '644152924206-6k8nj0il047gn2b2c0el3t8h6fu8hjcm.apps.googleusercontent.com',
    iosBundleId: 'com.example.refferalCode',
  );
}
