import 'package:get/get.dart';
import 'package:ridenepal/repo/booking_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';
import 'package:ridenepal/views/dash_screen.dart';

class AddBookingDetailsScreen extends GetxController {
  RxBool loading = RxBool(false);
  addBooking(String id, String date) async {
    loading.value = true;
    await BookingRepo.addBooking(
      date: date,
      vehicleId: id,
      onSuccess: () {
        loading.value = false;
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
