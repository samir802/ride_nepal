import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';

import '../controllers/splash_controller.dart';
import '../utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final c = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gif(
          autostart: Autostart.once,
          placeholder: (context) =>
              const Center(child: CircularProgressIndicator()),
          image: const AssetImage(ImagePath.logoGif),
        ),
      ),
    );
  }
}
