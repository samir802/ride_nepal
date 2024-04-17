import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/change_profile_screen_controller.dart';
import 'package:ridenepal/controllers/get_profile_controller.dart';
import 'package:ridenepal/widgets/customs/custom_password_fields.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final c = Get.put(ChangeProfileController());
  final e = Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
                key: c.changePassword,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("New password: "),
                    Obx(
                      () => CustomPasswordField(
                        hint: "New Password",
                        textInputAction: TextInputAction.done,
                        eye: c.passwordObscure.value,
                        onEyeClick: c.onEyeCLick,
                        controller: c.passwordController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Confirm password:"),
                    Obx(
                      () => CustomPasswordField(
                        hint: "Re-enter Password",
                        textInputAction: TextInputAction.done,
                        eye: c.passwordObscure.value,
                        onEyeClick: c.onEyeCLick,
                        controller: c.confirmPasswordController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            CustomLargeElevatedButton(
                title: "Change",
                onTap: () {
                  c.onSubmit();
                })
          ],
        ),
      )),
    );
  }
}
