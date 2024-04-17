import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/repo/rating_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';
import 'package:ridenepal/views/dash_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class AddRatingController extends GetxController {
  final ratingKey = GlobalKey<FormState>();

  final TextEditingController comment = TextEditingController();
  final e = Get.put(VehicleScreenController());

  var currentRating = 0.obs;

  void updateRating(int rating) {
    currentRating.value = rating;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit(
      int rating, String comment, String userId, String orderId) async {
    await AddRatingRepo.addRating(
        rating: rating.toString(),
        comment: comment,
        userId: userId,
        orderId: orderId,
        onSuccess: (message) async {
          loading.hide();
          e.vehicleDetails.clear();
          e.getVehicle();
          e.displayVehicleDetails.clear();
          e.getPopularVehicle();
          CustomSnackBar.success(
              title: "Review", message: "Reviewed Successfully");

          Get.offAll(() => DashScreen());
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Review", message: message);
        });
  }
}
