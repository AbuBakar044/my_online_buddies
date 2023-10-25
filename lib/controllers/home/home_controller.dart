import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/screens/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String? userID;

  @override
  void onInit() {
    getCurrentUserID();

    super.onInit();
  }

  //Future<void> getAllFriends() async {}

  Future<void> logoutUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.clear();

    Get.offAll(() => const LoginScreen());
  }

  Future<void> deleteFriend(String friendKey) async {
    firebaseFirestore.collection('users').doc(userID).collection('friends').doc(friendKey)
        .delete()
        .then((value) {
      storage.ref('friends').child(friendKey).delete();
    });
  }

  Future<void> getCurrentUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    userID = preferences.getString('user');
    update();
  }
}
