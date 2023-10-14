import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/screens/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('buddies');

  @override
  void onInit() {
    getAllFriends();
    super.onInit();
  }

  Future<void> getAllFriends() async {}

  Future<void> logoutUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.clear();

    Get.offAll(() => const LoginScreen());
  }
}
