import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';
import '../utils/colors.dart';
import '../utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final c = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(ImagePath.logo),
          ),
          SizedBox(
            height: 50,
          ),
          CircularProgressIndicator(
            backgroundColor: AppColors.secondaryColor,
            valueColor: AlwaysStoppedAnimation(AppColors.tertiaryColor),
          ),
        ],
      ),
    );
  }
}
