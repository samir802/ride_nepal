import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/repo/register_repo.dart';
import 'package:ridenepal/views/login_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../utils/custom_snackbar.dart';

class RegisterScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;
  RxBool passwordObscure1 = true.obs;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final addressController = TextEditingController();

  RxBool isChecked = false.obs;
  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onEyeCLick1() {
    passwordObscure1.value = !passwordObscure1.value;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit() async {
    if (formKey.currentState!.validate() &&
        passwordController.value == confirmPasswordController.value) {
      await RegisterRepo.register(
          email: emailController.text,
          name: fullNameController.text,
          phoneNumber: phoneNoController.text,
          address: addressController.text,
          password: passwordController.text,
          onSuccess: (message) async {
            loading.hide();
            CustomSnackBar.success(
                title: "Register", message: "Register Successful");
            Get.offAll(() => LoginScreen());
          },
          onError: (message) {
            loading.hide();
            CustomSnackBar.error(title: "Register", message: message);
          });
      fullNameController.clear();
      emailController.clear();
      phoneNoController.clear();
      addressController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    } else {
      if (passwordController.value != confirmPasswordController.value) {
        CustomSnackBar.error(
            title: "Sign up",
            message: "Password did not match! Please try again!");
        passwordController.clear();
        confirmPasswordController.clear();
      } else {
        CustomSnackBar.error(title: "Sign up", message: "Please try again!");
        passwordController.clear();
        confirmPasswordController.clear();
      }
    }
  }
}
