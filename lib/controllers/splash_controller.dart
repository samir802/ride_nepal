import 'package:get/get.dart';

import '../views/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => LoginScreen());
    });
    super.onInit();
  }
}
