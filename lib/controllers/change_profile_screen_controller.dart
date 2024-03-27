import 'dart:io';

// ignore: depend_on_referenced_packages
import "package:async/async.dart";
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ridenepal/models/profile_details.dart';
import 'package:ridenepal/repo/profile_details_repo.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';

class ChangeProfileController extends GetxController {
  @override
  void onInit() {
    getAllProfileDetails();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<ProfileDetails> profileDetails = <ProfileDetails>[].obs;
  getAllProfileDetails() async {
    loading.value = true;
    await ProfileDetailsRepo.getProfileDetails(
      onSuccess: (allProfileDetails) {
        loading.value = false;
        profileDetails.addAll(allProfileDetails);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Profile", message: message);
      }),
    );
  }

  final keys = GlobalKey<FormState>;
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
  }

  Future<void> updateProfile(File imageFile, String token) async {
    // ignore: deprecated_member_use
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("${Api.baseUrl}/uploads.php?token=$token");

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
}
