import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/splash_screen.dart';

void main() {
  runApp(const RideNepal());
}

class RideNepal extends StatelessWidget {
  const RideNepal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ride Nepal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
