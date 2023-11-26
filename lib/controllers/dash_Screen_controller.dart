import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/home_screen.dart';

class DashScreenController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList(
    [
      const HomeScreen(),
    ],
  );

  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
