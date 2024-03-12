import 'package:get/get.dart';
import 'package:ridenepal/models/history_model.dart';
import 'package:ridenepal/repo/history_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';

class HistoryScreenController extends GetxController {
  @override
  void onInit() {
    getAllHistory();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<OrderDetails> historyDetail = <OrderDetails>[].obs;
  getAllHistory() async {
    loading.value = true;
    await HistoryRepo.getHistory(
      onSuccess: (allVehicles) {
        loading.value = false;
        historyDetail.addAll(allVehicles);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "History", message: message);
      }),
    );
  }
}
