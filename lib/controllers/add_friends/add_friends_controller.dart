import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_online_buddies/constants/constants.dart';

class AddFriendsController extends GetxController {
  final friendNameCtrl = TextEditingController();
  final friendNmbrCtrl = TextEditingController();
  final friendDescCtrl = TextEditingController();
  final addFrndFormKey = GlobalKey<FormState>();
  Uint8List? friendImage;

  void checkValidation() {
    if (addFrndFormKey.currentState!.validate()) {
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
}
