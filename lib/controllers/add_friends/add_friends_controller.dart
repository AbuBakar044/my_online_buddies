import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_online_buddies/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFriendsController extends GetxController {
  final friendNameCtrl = TextEditingController();
  final friendNmbrCtrl = TextEditingController();
  final friendDescCtrl = TextEditingController();
  final addFrndFormKey = GlobalKey<FormState>();
  Uint8List? friendImage;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void checkValidation() {
    if (addFrndFormKey.currentState!.validate()) {
      saveUserDataToDB();
      Get.snackbar(appName, 'Form Validate');
    }
  }

  pickImage(ImageSource source) async {
    XFile? tempImage = await ImagePicker().pickImage(source: source);
    if (tempImage == null) {
      return;
    } else {
      friendImage = await tempImage.readAsBytes();
      update();
    }
  }

  Future<void> saveUserDataToDB() async {
    Map<String, dynamic> friendsData = {
      'name': friendNameCtrl.text,
      'number': friendNmbrCtrl.text,
      'desc': friendDescCtrl.text,
    };
    firestore
        .collection('buddies')
        .doc(UniqueKey().toString())
        .set(friendsData)
        .then((value) {
      Get.snackbar('Online Buddies', 'Data tur gya j bhai jan');
    });
  }
}
