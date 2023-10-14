import 'package:get/get.dart';
import 'package:my_online_buddies/screens/auth/login.dart';
import 'package:my_online_buddies/screens/auth/register.dart';
import 'package:my_online_buddies/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      checkUser();
      //Get.off(() => Error());
    });
    super.onInit();
  }

  Future<void> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('user')) {
      Get.offAll(() => const HomeScreen());
    } else {
      Get.off(() => const LoginScreen());
    }
  }
}
