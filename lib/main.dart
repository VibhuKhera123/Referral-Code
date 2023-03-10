import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:refferal_code/firebase_options.dart';
import 'package:refferal_code/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MobileNumberVerification(),
    ),
  );
}
