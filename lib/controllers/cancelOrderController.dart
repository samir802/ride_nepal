import 'dart:developer';

import 'package:get/get.dart';
import 'package:ridenepal/controllers/history_controller.dart';
import 'package:ridenepal/repo/cancelOrder_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';
import 'package:ridenepal/views/dash_screen.dart';
import 'package:ridenepal/views/history.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class CancelOrderController extends GetxController {
  final c = Get.put(HistoryScreenController());

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit(String orderId) async {
    log("Controller:$orderId");
    await CancelOrderRepo.cancelOrder(
        orderID: orderId,
        onSuccess: (message) async {
          loading.hide();
          c.historyDetail.clear();
          c.getAllHistory();
          CustomSnackBar.success(
              title: "Cancel Order", message: "Cancelled Successfully");

          Get.offAll(() => DashScreen());
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Cancel Order", message: message);
        });
  }
}
