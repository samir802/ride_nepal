import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/dash_Screen_controller.dart';

class DashScreen extends StatelessWidget {
  DashScreen({super.key});

  final c = Get.put(DashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => c.pages[c.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          backgroundColor: Colors.white,
          itemCornerRadius: 24,
          selectedIndex: c.currentIndex.value,
          onItemSelected: c.onItemTapped,
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home, size: 28),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 14,
                  color: c.currentIndex.value == 0
                      ? const Color.fromARGB(255, 2, 20, 140)
                      : const Color.fromARGB(255, 2, 20, 140),
                ),
              ),
              textAlign: TextAlign.center,
              activeColor: const Color.fromARGB(255, 2, 20, 140),
              inactiveColor: const Color.fromARGB(255, 2, 20, 140),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.search, size: 28),
              title: Text(
                "Search",
                style: TextStyle(
                  fontSize: 14,
                  color: c.currentIndex.value == 1
                      ? const Color.fromARGB(255, 2, 20, 140)
                      : const Color.fromARGB(255, 2, 20, 140),
                ),
              ),
              textAlign: TextAlign.center,
              activeColor: const Color.fromARGB(255, 2, 20, 140),
              inactiveColor: const Color.fromARGB(255, 2, 20, 140),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.car_rental, size: 28),
              title: Text(
                "Vehicles",
                style: TextStyle(
                  fontSize: 14,
                  color: c.currentIndex.value == 1
                      ? const Color.fromARGB(255, 2, 20, 140)
                      : const Color.fromARGB(255, 2, 20, 140),
                ),
              ),
              textAlign: TextAlign.center,
              activeColor: const Color.fromARGB(255, 2, 20, 140),
              inactiveColor: const Color.fromARGB(255, 2, 20, 140),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.history, size: 28),
              title: Text(
                "History",
                style: TextStyle(
                  fontSize: 14,
                  color: c.currentIndex.value == 2
                      ? const Color.fromARGB(255, 2, 20, 140)
                      : const Color.fromARGB(255, 2, 20, 140),
                ),
              ),
              textAlign: TextAlign.center,
              activeColor: const Color.fromARGB(255, 2, 20, 140),
              inactiveColor: const Color.fromARGB(255, 2, 20, 140),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person, size: 28),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 14,
                  color: c.currentIndex.value == 3
                      ? const Color.fromARGB(255, 2, 20, 140)
                      : const Color.fromARGB(255, 2, 20, 140),
                ),
              ),
              textAlign: TextAlign.center,
              activeColor: const Color.fromARGB(255, 2, 20, 140),
              inactiveColor: const Color.fromARGB(255, 2, 20, 140),
            ),
          ],
        ),
      ),
    );
  }
}
