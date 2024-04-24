import 'dart:io';
import "package:async/async.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/get_profile_controller.dart';
import 'package:ridenepal/repo/change_password_repo.dart';
import 'package:ridenepal/repo/profile_details_repo.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';
import 'package:ridenepal/utils/storage_keys.dart';
import 'package:ridenepal/views/change_password.dart';
import 'package:ridenepal/views/dash_screen.dart';
import 'package:ridenepal/views/login_screen.dart';
import 'package:ridenepal/views/otp.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

final c = Get.put(CoreController());
final d = Get.put(GetProfileController());

class ChangeProfileController extends GetxController {
  final changePassword = GlobalKey<FormState>();
  // RxBool loading = RxBool(false);

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  RxBool passwordObscure = true.obs;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final email = TextEditingController();

  TextEditingController otpController = TextEditingController();
  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  File paths = File("");

  Rxn<File> profile = Rxn<File>();
  final picker = ImagePicker();

  void pickImage() async {
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    if (pickedImage != null) {
      profile.value = File(pickedImage.path);
      paths = File(pickedImage.path);
      String token = StorageHelper.getToken();
      updateProfile(paths, token);
    }
  }

  Future<void> updateProfile(File imageFile, String token) async {
    // ignore: deprecated_member_use
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("${Api.updateProfile}?token=$token");

    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);

    var respond = await request.send();
    if (respond.statusCode == 200) {
      CustomSnackBar.success(
          title: "Upload", message: "Image Uploaded Successfully");
    } else {
      CustomSnackBar.error(title: "Upload", message: "Image Uploaded Failed");
    }
  }

  void updateProfileDetails(
      String email, String name, String phone, String address) async {
    await ProfileDetailsRepo.updateProfile(
        email: email,
        name: name,
        phone: phone,
        address: address,
        onSuccess: (message) async {
          loading.show(message: "Please wait..");
          CustomSnackBar.success(
              title: "Update", message: "Updated Successfully");
          await Get.off(DashScreen());
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Updated", message: "Failed in updating");
        });
  }

  void sendEmail(String recipientEmail) {
    loading.show(message: "Please wait..");
    ChangePasswordRepo.sendOTP(
        email: recipientEmail,
        onSuccess: (message) async {
          loading.hide();
          CustomSnackBar.success(
              title: "OTP", message: "OTP send successfully");
          Get.to(OTPVerificationPage(email: recipientEmail));
        },
        onError: (message) {
          CustomSnackBar.error(title: "OTP", message: message);
        });
  }

  void verifyOTP(String otp, String recipientEmail) {
    ChangePasswordRepo.verifyOTP(
        otp: otp,
        email: recipientEmail,
        onSuccess: (message) async {
          CustomSnackBar.success(
              title: "OTP Verification", message: "OTP Verified");
          Get.to(ChangePassword());
        },
        onError: (message) {
          CustomSnackBar.error(title: "OTP", message: message);
        });
  }

  void onSubmit() async {
    if (changePassword.currentState!.validate() &&
        passwordController.value == confirmPasswordController.value) {
      await ChangePasswordRepo.changePassword(
          password: passwordController.text,
          email: email.text.toString(),
          onSuccess: (message) async {
            CustomSnackBar.success(
                title: "Password", message: "Changed password Successfully");
            Get.offAll(LoginScreen());
          },
          onError: (message) {
            CustomSnackBar.error(title: "Password", message: message);
          });
      passwordController.clear();
      confirmPasswordController.clear();
    } else {
      if (passwordController.value != confirmPasswordController.value) {
        CustomSnackBar.error(
            title: "Change Password",
            message: "Password did not match! Please try again!");
        passwordController.clear();
        confirmPasswordController.clear();
      } else {
        CustomSnackBar.error(
            title: "Change Password", message: "Please try again!");
        passwordController.clear();
        confirmPasswordController.clear();
      }
    }
  }
}
