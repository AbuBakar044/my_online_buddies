import 'package:get/get.dart';
import 'package:my_online_buddies/screens/home/home_screen.dart';

class SplashController extends GetxController {
  
  
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => const HomeScreen());
    });
    super.onInit();
  }
}
