import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/views/login_screen.dart';

import '../controllers/register_controller.dart';
import '../utils/colors.dart';
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
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      key: c.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            "Email Address",
                            style: TextStyle(fontSize: 15),
                          ),
                          CustomTextField(
                            validator: Validators.checkEmailField,
                            controller: c.emailController,
                            hint: "Enter your email address",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            preIconPath: Icons.email,
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
                            textInputType: TextInputType.emailAddress,
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
                    CustomElevatedButton(
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
