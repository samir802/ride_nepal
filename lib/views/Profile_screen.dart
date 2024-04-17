import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/change_profile_screen_controller.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/get_profile_controller.dart';
import 'package:ridenepal/models/profile_details.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/views/change_password_with_email.dart';
import 'package:ridenepal/views/edit_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final c = Get.put(CoreController());
  final d = Get.put(ChangeProfileController());
  final e = Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {
    RxList<ProfileDetails> profileDetails = e.profileDetails;
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
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          d.pickImage();
                        },
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: (d.profile.value != null)
                                ? Image.file(
                                    d.profile.value!,
                                    fit: BoxFit.fill,
                                    height: 120,
                                    width: 120,
                                  )
                                : CircleAvatar(
                                    radius: 60,
                                    backgroundImage: CachedNetworkImageProvider(
                                        "${Api.baseUrl}/uploads/${profileDetails.first.image ?? " "}"),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        d.pickImage();
                      },
                      child: const Text(
                        "Change Photo",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 60,
                      child: Obx(
                        () => Column(
                          children: [
                            Text(
                              profileDetails.first.name ?? "Name",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              profileDetails.first.email ?? "Email",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 74, 74, 74)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
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
                  onTap: () {
                    // Get.to(EmailPasswordChange());
                    // Get.to(OTPVerificationPage());
                  },
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
          ],
        ),
      ),
    );
  }
}
