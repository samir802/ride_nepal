import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:ridenepal/views/login_screen.dart';

import '../controllers/register_controller.dart';
import '../utils/image_path.dart';
import '../utils/validator.dart';
import '../widgets/customs/custom_password_fields.dart';
import '../widgets/customs/custom_textfield.dart';
import '../widgets/customs/elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register-screen";
  RegisterScreen({super.key});
  final c = Get.put(RegisterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Register Here",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Form(
                      key: c.registerKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Obx(
                              () => CircleAvatar(
                                radius: 60,
                                child: ClipOval(
                                  child: (c.profile.value != null)
                                      ? Image.file(
                                          c.profile.value!,
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 120,
                                        )
                                      : const CircleAvatar(
                                          radius: 60,
                                          backgroundImage: AssetImage(
                                              ImagePath.defaultProfile),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              c.pickImage();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Choose Photo",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "Full Name",
                          ),
                          CustomTextField(
                            validator: Validators.checkFieldEmpty,
                            controller: c.fullNameController,
                            hint: "Enter your full name",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            preIconPath: Icons.person,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Phone No",
                            style: TextStyle(fontSize: 15),
                          ),
                          CustomTextField(
                            validator: Validators.checkPhoneField,
                            controller: c.phoneNoController,
                            hint: "Enter your phone number",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.phone,
                            preIconPath: Icons.phone,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Address",
                            style: TextStyle(fontSize: 15),
                          ),
                          CustomTextField(
                            // validator: Validators.checkPhoneField,
                            controller: c.addressController,
                            hint: "Enter your address",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.text,
                            preIconPath: Icons.location_on,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Email",
                            style: TextStyle(fontSize: 15),
                          ),
                          CustomTextField(
                            validator: Validators.checkEmailField,
                            controller: c.emailController,
                            hint: "Enter your email",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            preIconPath: Icons.email,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(fontSize: 15),
                          ),
                          Obx(
                            () => CustomPasswordField(
                              validator: Validators.checkPasswordField,
                              hint: "Enter your password",
                              eye: c.passwordObscure.value,
                              onEyeClick: c.onEyeCLick,
                              controller: c.passwordController,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Confirm Password",
                            style: TextStyle(fontSize: 15),
                          ),
                          Obx(
                            () => CustomPasswordField(
                              validator: Validators.checkPasswordField,
                              hint: "Re-enter your password",
                              eye: c.passwordObscure1.value,
                              onEyeClick: c.onEyeCLick1,
                              controller: c.confirmPasswordController,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomLargeElevatedButton(
                        title: "Register",
                        onTap: () {
                          c.onSubmit();
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
