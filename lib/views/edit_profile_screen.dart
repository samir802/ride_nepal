import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/change_profile_screen_controller.dart';
import 'package:ridenepal/controllers/get_profile_controller.dart';
import 'package:ridenepal/models/profile_details.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final d = Get.put(ChangeProfileController());
  final e = Get.put(GetProfileController());
  final profileKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RxList<ProfileDetails> details = e.profileDetails;
    nameController.text = details.first.name ?? "";
    emailController.text = details.first.email ?? "";
    phoneController.text = details.first.phone ?? "";
    addressController.text = details.first.address ?? "";
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
              Form(
                  key: profileKey,
                  child: Column(
                    children: [
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
                    ],
                  )),
              CustomLargeElevatedButton(
                title: "Update Profile",
                onTap: () {
                  d.updateProfileDetails(
                      emailController.text,
                      nameController.text,
                      phoneController.text,
                      addressController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
