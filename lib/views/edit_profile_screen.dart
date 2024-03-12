import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/change_profile_screen_controller.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/storage_keys.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final c = Get.put(CoreController());
  final d = Get.put(ChangeProfileController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = c.currentUser.value?.name ?? "";
    emailController.text = c.currentUser.value?.email ?? "";
    phoneController.text = c.currentUser.value?.phone ?? "";
    addressController.text = c.currentUser.value?.address ?? "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Obx(
                () => CircleAvatar(
                  radius: 60,
                  child: ClipOval(
                    child: (d.profile.value != null)
                        ? Image.file(
                            d.profile.value!,
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: CachedNetworkImageProvider(
                                "${Api.baseUrl}/uploads/${c.currentUser.value?.image ?? " "}"),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                  onPressed: () {
                    d.pickImage();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      Text(
                        "Change Photo",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                controller: phoneController,
                decoration: const InputDecoration(
                  label: Text("Phone"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                controller: addressController,
                decoration: const InputDecoration(
                  label: Text("Address"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomLargeElevatedButton(
                  title: "Update Profile",
                  onTap: () {
                    String token = StorageHelper.getToken();
                    d.updateProfile(d.paths, token);
                    Get.back();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
