import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/constant/esewa.dart';
import 'package:ridenepal/controllers/add_booking_details.dart';
import 'package:ridenepal/controllers/history_controller.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';

final c = Get.put(AddBookingDetailsScreen());
final d = Get.put(HistoryScreenController());

class Esewa {
  pay(String vehicleId, String startDate, String returnDate,
      String totalPrice) {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kEsewaClienId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20",
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          c.addBooking(vehicleId, startDate, returnDate, totalPrice);
          d.historyDetail.clear();
          d.getAllHistory();
        },
        onPaymentFailure: (data) {
          CustomSnackBar.error(title: "Payment", message: "Payment Failure");
        },
        onPaymentCancellation: (data) {
          CustomSnackBar.info(title: "Payment", message: "Payment Cancel");
        },
      );
    } catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }
}
