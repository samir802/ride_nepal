import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/views/Profile_screen.dart';
import 'package:ridenepal/views/all_vehicles_screen.dart';
import 'package:ridenepal/views/history.dart';

import '../views/home_screen.dart';

class DashScreenController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  final List<Widget> pages = [
    const HomeScreen(),
    AllVehicleScreen(),
    const History(),
    ProfileScreen(),
  ];
}
