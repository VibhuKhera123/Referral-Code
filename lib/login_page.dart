import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_autofill/flutter_sms_autofill.dart';
import 'package:sms_autodetect/sms_autodetect.dart';


class MobileNumberVerification extends StatefulWidget {
  const MobileNumberVerification({super.key});

  @override
  State<MobileNumberVerification> createState() =>
      _MobileNumberVerificationState();
}

class _MobileNumberVerificationState extends State<MobileNumberVerification> {
  String? phoneNo, verificationId, smsCode;
  bool showOTPForm = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Number Verification'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (!showOTPForm) buildMobileNumberForm() else buildOTPForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMobileNumberForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Phone number is required';
              }
              return null;
            },
            onSaved: (String? value) {
              phoneNo = value;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                sendOTP();
              }
            },
            child: const Text('Send OTP'),
          ),
        ],
      ),
    );
  }

  Widget buildOTPForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
          ),
          controller: _pinCodeController,
          onChanged: (String value) {},
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            if (_pinCodeController.text.isNotEmpty) {
              await SmsAutoFill().listenForCode;
              smsCode = _pinCodeController.text;
              verifyOTP();
            }
          },
          child: const Text('Verify OTP'),
        ),
      ],
    );
  }

  Future<void> sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo!,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to verify Phone Number')));
      },
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          this.verificationId = verificationId;
          showOTPForm = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 120),
    );
  }

  Future<void> verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: smsCode!);

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      if (value.user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid OTP')));
    });
  }
}
