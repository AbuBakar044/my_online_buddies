import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/screens/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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

  Future<void> deleteFriend(String friendKey) async {
   firebaseFirestore.collection('buddies').doc(friendKey).delete();
   
  }
}
