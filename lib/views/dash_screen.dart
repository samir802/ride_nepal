import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/dash_Screen_controller.dart';

int maxCount = 5;

class DashScreen extends StatelessWidget {
  DashScreen({super.key});

  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  final c = Get.put(DashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(c.pages.length, (index) => c.pages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (c.pages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              kIconSize: 20,
              kBottomRadius: 3,
              notchBottomBarController: _controller,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.car_rental,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.car_rental,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Vehicle',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.history,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.history,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'History',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Profile',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              })
          : null,
    );
  }
}
