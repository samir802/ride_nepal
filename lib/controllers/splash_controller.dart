import 'dart:async';

import 'package:get/get.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/views/dash_screen.dart';
import 'package:ridenepal/views/login_screen.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());
  @override
  void onInit() {
    Timer(const Duration(seconds: 4), () async {
      if (c.isUserLoggedIn()) {
        Get.offAll(DashScreen());
      } else {
        Get.offAll(LoginScreen());
      }
    });
    super.onInit();
  }
}
