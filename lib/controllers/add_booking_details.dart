import 'package:get/get.dart';
import 'package:ridenepal/controllers/history_controller.dart';
import 'package:ridenepal/repo/booking_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';
import 'package:ridenepal/views/dash_screen.dart';

class AddBookingDetailsScreen extends GetxController {
  final c = Get.put(HistoryScreenController());

  RxBool loading = RxBool(false);
  addBooking(
      String id, String startDate, String returnDate, String totalPrice) async {
    loading.value = true;
    await BookingRepo.addBooking(
      startDate: startDate,
      returnDate: returnDate,
      vehicleId: id,
      totalPrice: totalPrice,
      onSuccess: () {
        loading.value = false;
        c.historyDetail.clear();
        c.getAllHistory();

        Get.offAll(() => DashScreen());
        CustomSnackBar.success(
            title: "Booking", message: "Booking is done sucessfully");
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Booking", message: message);
      }),
    );
  }
}
