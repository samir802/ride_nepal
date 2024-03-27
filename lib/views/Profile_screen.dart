import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/views/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final c = Get.put(CoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: CachedNetworkImageProvider(
                  "${Api.baseUrl}/uploads/${c.currentUser.value?.image}"),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width,
              height: 60,
              child: Obx(
                () => Column(
                  children: [
                    Text(
                      c.currentUser.value?.name ?? " ",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      c.currentUser.value?.email ?? " ",
                      style: const TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 74, 74, 74)),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            SizedBox(
              height: 400,
              width: Get.width,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Edit'),
                    leading: const Icon(Icons.edit),
                    onTap: () {
                      Get.to(EditProfileScreen());
                    },
                  ),
                  ListTile(
                    title: const Text('Change Password'),
                    leading: const Icon(Icons.lock),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Dark Mode'),
                    leading: const Icon(Icons.mode_night_outlined),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('About Us'),
                    leading: const Icon(
                      Icons.question_mark,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    onTap: () {
                      c.logOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
