import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('buddies');

  @override
  void onInit() {
    getAllFriends();
    super.onInit();
  }

  Future<void> getAllFriends() async {}
}
