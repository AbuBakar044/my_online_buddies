import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/screens/home/home_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final phoneCtrl = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: phoneCtrl,
          ),
          ElevatedButton(
            onPressed: () {
              sendOTP();
            },
            child: const Text(
              'Send OTP',
            ),
          )
        ],
      ),
    );
  }

  Future<void> sendOTP() async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneCtrl.text,
      verificationCompleted: (PhoneAuthCredential credential) {
        

        // auth.signInWithPhoneNumber(phoneCtrl.text).then((value) {
        //   Get.to(() => HomeScreen());
        // });
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
