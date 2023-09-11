import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/constants/constants.dart';

class AddFriendsController extends GetxController {
  final friendNameCtrl = TextEditingController();
  final friendNmbrCtrl = TextEditingController();
  final friendDescCtrl = TextEditingController();
  final addFrndFormKey = GlobalKey<FormState>();

  void checkValidation() {
    if (addFrndFormKey.currentState!.validate()) {
      Get.snackbar(appName, 'Form Validate');
    }
  }
}
