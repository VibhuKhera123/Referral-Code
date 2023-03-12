import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refferal_code/home_page.dart';
import 'package:refferal_code/ref_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String verificationId = "";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Enter your mobile number with country code"),
            TextField(
              controller: _phone,
              decoration: const InputDecoration(
                hintText: "+91xxxxxxxxxx",
                labelText: "Mobile Number",
              ),
            ),
            FilledButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: _phone.text,
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ReferralScreen(),
                        ),
                      );
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      print(e.code);
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      LoginPage.verificationId = verificationId;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    timeout: const Duration(minutes: 2));
              },
              child: const Text("Get OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
