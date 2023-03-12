import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:refferal_code/login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var smsCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PinCodeTextField(
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: const Color.fromARGB(255, 206, 241, 236),
                ),
                appContext: context,
                length: 6,
                onChanged: (value) {
                  setState(() {
                    smsCode = value;
                  });
                },
              ),
            ),
            FilledButton(
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: LoginPage.verificationId,
                  smsCode: smsCode,
                );
                await FirebaseAuth.instance.signInWithCredential(credential);
              },
              child: const Text("Verify"),
            )
          ],
        ),
      ),
    );
  }
}
