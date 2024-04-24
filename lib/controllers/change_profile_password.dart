import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/repo/change_password_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';
import 'package:ridenepal/views/dash_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class ChangeProfilePasswordController extends GetxController {
  final passwordKey = GlobalKey<FormState>();

  RxBool passwordObscure = true.obs;
  RxBool passwordObscure2 = true.obs;

  final oldpasswordController = TextEditingController();
  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  RxBool isChecked = false.obs;

  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onEyeCLick2() {
    passwordObscure2.value = !passwordObscure2.value;
  }

  void onSubmit() async {
    if (passwordKey.currentState!.validate() &&
        newpasswordController.text == confirmpasswordController.text) {
      loading.show(message: "Please wait..");
      await ChangePasswordRepo.changeProfilePassword(
          oldpassword: oldpasswordController.text,
          newpassword: newpasswordController.text,
          onSuccess: ((message) async {
            loading.hide();
            CustomSnackBar.success(title: "Change Password", message: message);
            Get.offAll(DashScreen());
            oldpasswordController.clear();
            newpasswordController.clear();
            confirmpasswordController.clear();
          }),
          onError: (message) {
            loading.hide();
            CustomSnackBar.error(title: "Change Password", message: message);
          });
    } else {
      if (newpasswordController.text != confirmpasswordController.text) {
        CustomSnackBar.error(
          title: "Change Password",
          message: "Password did not match! Please try again!",
        );
        newpasswordController.clear();
        confirmpasswordController.clear();
      }
    }
  }
}
