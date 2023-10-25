import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_online_buddies/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditFriendController extends GetxController {
  final friendNameCtrl = TextEditingController();
  final friendNmbrCtrl = TextEditingController();
  final friendDescCtrl = TextEditingController();
  final addFrndFormKey = GlobalKey<FormState>();
  var imageUrl;
  String? key;
  Uint8List? friendImage;
  File? imageFile;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String? userID;
  @override
  void onInit() {
    getCurrentUserID();
    super.onInit();
  }

  void checkValidation() {
    if (addFrndFormKey.currentState!.validate()) {
      saveUserDataToDB();
      Get.snackbar(appName, 'Form Validate');
    }
  }

  Future<void> pickImage(ImageSource source) async {
    XFile? tempImage = await ImagePicker().pickImage(source: source);
    if (tempImage == null) {
      return;
    } else {
      friendImage = await tempImage.readAsBytes();
      imageFile = File(tempImage.path);
      update();
    }
  }

  Future<void> saveUserDataToDB() async {
    Map<String, dynamic> friendsData = {
      'name': friendNameCtrl.text,
      'number': friendNmbrCtrl.text,
      'desc': friendDescCtrl.text,
      'key': key,
    };
    firestore
        .collection('users')
        .doc(userID)
        .collection('friends')
        .doc(key)
        .update(friendsData)
        .then((value) {
      saveUserImage().then((value) {
        friendDescCtrl.clear();
        friendNameCtrl.clear();
        friendNmbrCtrl.clear();
        friendImage = null;
        update();
      });
    });
  }

  Future<void> saveUserImage() async {
    TaskSnapshot snapshot =
        await firebaseStorage.ref('friends').child(key!).putFile(imageFile!);
    imageUrl = await snapshot.ref.getDownloadURL();

    print('..................$imageUrl');

    Map<String, dynamic> imageMap = {'image': imageUrl};

    firestore
        .collection('users')
        .doc(userID)
        .collection('friends')
        .doc(key).update(imageMap).then((value) {
      Get.snackbar('Online Buddies', 'Data and Image saved');
    });
  }

  Future<void> getCurrentUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    userID = preferences.getString('user');
    update();
  }
}
