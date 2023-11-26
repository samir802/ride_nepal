import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final formkey = GlobalKey<FormState>();

  RxBool isPasswordVisible = false.obs;

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  void onEyeCLick() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
