import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/change_profile_password.dart';
import 'package:ridenepal/widgets/customs/custom_password_fields.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class ChangeProfilePassword extends StatelessWidget {
  ChangeProfilePassword({super.key});

  final c = Get.put(ChangeProfilePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: c.passwordKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Enter your Old Password:"),
                Obx(
                  () => CustomPasswordField(
                    hint: "Enter Old Password",
                    eye: c.passwordObscure.value,
                    onEyeClick: c.onEyeCLick,
                    controller: c.oldpasswordController,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Enter your New Password:"),
                Obx(
                  () => CustomPasswordField(
                    hint: "Enter New Password",
                    eye: c.passwordObscure2.value,
                    onEyeClick: c.onEyeCLick2,
                    controller: c.newpasswordController,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Confirm Password:"),
                Obx(
                  () => CustomPasswordField(
                    hint: "Confirm Password",
                    eye: c.passwordObscure2.value,
                    onEyeClick: c.onEyeCLick2,
                    controller: c.confirmpasswordController,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomLargeElevatedButton(
                    title: "Change Password",
                    onTap: () {
                      c.onSubmit();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
