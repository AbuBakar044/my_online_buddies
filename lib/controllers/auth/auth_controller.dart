import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/constants/constants.dart';
import 'package:my_online_buddies/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final rNameCtrl = TextEditingController();
  final rEmailCtrl = TextEditingController();
  final rPwdCtrl = TextEditingController();

  final lEmailCtrl = TextEditingController();
  final lPwdCtrl = TextEditingController();
  final rAuthFormKey = GlobalKey<FormState>();
  final lAuthFormKey = GlobalKey<FormState>();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? userID;

  Future<bool> validateAllFields(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      Get.snackbar(appName, 'Form Validated');
      return true;
      //registerUser();
    } else {
      return false;
    }
  }

  Future<void> registerUser() async {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: rEmailCtrl.text, password: rPwdCtrl.text)
          .then((value) {
            saveUser(value.user!.uid);
        saveUserData(value.user!.uid).then((value) {
          
          Get.offAll(() => const HomeScreen());
        });
        Get.snackbar(appName, 'User Saved Successfully');
      });
    } on FirebaseException catch (e) {
      Get.snackbar(appName, e.message.toString());
    }
  }

  Future<void> saveUserData(String userID) async {
    Map<String, dynamic> userData = {
      'id': userID,
      'name': rNameCtrl.text,
      'email': rEmailCtrl.text,
      'pwd': rPwdCtrl.text,
    };
    firestore.collection('users').doc(userID).set(userData);
  }

  Future<void> loginUser() async {
    try {
      firebaseAuth
          .signInWithEmailAndPassword(
        email: lEmailCtrl.text,
        password: lPwdCtrl.text,
      )
          .then((value) {
        saveUser(value.user!.uid);
        Get.offAll(() => const HomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(appName, 'An error has occoured');
    }
  }

  Future<void> saveUser(String userID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', userID);

    print('.........................$userID');
  }
}
