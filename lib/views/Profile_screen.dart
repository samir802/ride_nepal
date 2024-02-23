import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/core_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final c = Get.put(CoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    c.logOut();
                  },
                  child: const Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
