import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/views/profile_screen.dart';
import 'package:ridenepal/views/all_vehicles_screen.dart';
import 'package:ridenepal/views/history.dart';
import '../views/home_screen.dart';

class DashScreenController extends GetxController {
  RxList<Widget> pages = RxList(
    [
      HomeScreen(),
      AllVehicleScreen(),
      History(),
      ProfileScreen(),
    ],
  );

  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
