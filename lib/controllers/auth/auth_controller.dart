import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/constants/constants.dart';

class AuthController extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();
  final authFormKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? userID;

  Future<void> validateAllFields() async {
    if (authFormKey.currentState!.validate()) {
      Get.snackbar(appName, 'Form Validated');
      registerUser();
    }
  }

  Future<void> registerUser() async {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailCtrl.text, password: pwdCtrl.text)
          .then((value) {
        saveUserData(value.user!.uid);
        Get.snackbar(appName, 'User Saved Successfully');
      });
    } on FirebaseException catch (e) {
      Get.snackbar(appName, e.message.toString());
    }
  }

  Future<void> saveUserData(String userID) async {
    Map<String, dynamic> userData = {
      'name': nameCtrl.text,
      'email': emailCtrl.text,
      'pwd': pwdCtrl.text,
    };
    firestore.collection('users').doc(userID).set(userData);
  }
}
