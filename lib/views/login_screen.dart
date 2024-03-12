import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/utils/validator.dart';
import 'package:ridenepal/widgets/customs/custom_password_fields.dart';
import 'package:ridenepal/widgets/customs/custom_textfield.dart';

import '../controllers/login_controller.dart';
import '../utils/colors.dart';
import '../utils/image_path.dart';
import '../widgets/customs/elevated_button.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final c = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(ImagePath.logo),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          letterSpacing: 5,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: c.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(fontSize: 15),
                            ),
                            CustomTextField(
                              controller: c.emailController,
                              preIconPath: Icons.email,
                              hint: "Enter you email",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              validator: Validators.checkEmailField,
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
                                  hint: "Enter you password",
                                  eye: c.passwordObscure.value,
                                  onEyeClick: c.onEyeCLick,
                                  controller: c.passwordController,
                                  textInputAction: TextInputAction.next),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 190),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      CustomLargeElevatedButton(
                        title: "Login",
                        onTap: () {
                          c.onSubmit();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          InkWell(
                            onTap: () {
                              Get.offAll(() => RegisterScreen());
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: AppColors.rejected),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
