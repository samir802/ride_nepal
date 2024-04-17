import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ridenepal/repo/register_repo.dart';
import 'package:ridenepal/views/login_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../utils/custom_snackbar.dart';

class RegisterScreenController extends GetxController {
  final registerKey = GlobalKey<FormState>();
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

  File paths = File("");

  Rxn<File> profile = Rxn<File>();
  final picker = ImagePicker();

  void pickImage() async {
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    if (pickedImage != null) {
      profile.value = File(pickedImage.path);
      paths = File(pickedImage.path);
    }
    if (pickedImage == null) {
      Get.dialog(
        AlertDialog(
          title: const Text("Please choose an image"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void onSubmit() async {
    if (registerKey.currentState!.validate() &&
        passwordController.text == confirmPasswordController.text) {
      await RegisterRepo.register(
        email: emailController.text,
        name: fullNameController.text,
        phoneNumber: phoneNoController.text,
        address: addressController.text,
        password: passwordController.text,
        imageFile: paths,
        onSuccess: (message) async {
          loading.hide();
          CustomSnackBar.success(
            title: "Register",
            message: "Registration Successful",
          );
          Get.offAll(LoginScreen());
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(
            title: "Register",
            message: message,
          );
        },
      );
      fullNameController.clear();
      emailController.clear();
      phoneNoController.clear();
      addressController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    } else {
      if (passwordController.text != confirmPasswordController.text) {
        CustomSnackBar.error(
          title: "Sign up",
          message: "Password did not match! Please try again!",
        );
        passwordController.clear();
        confirmPasswordController.clear();
      } else {
        CustomSnackBar.error(
          title: "Sign up",
          message: "Please try again!",
        );
        passwordController.clear();
        confirmPasswordController.clear();
      }
    }
  }
}
