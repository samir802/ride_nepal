import 'package:get/get.dart';
import 'package:ridenepal/models/all_driver.dart';
import 'package:ridenepal/repo/driver_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';

class GetDriverController extends GetxController {
  var showDriverDetails = false.obs;
  var driverSelected = false.obs; // Add driverSelected variable

  void toggleDriverDetails() {
    showDriverDetails.value = !showDriverDetails.value;
  }

  RxBool loading = RxBool(false);
  RxList<AllDriver> driverDetails = <AllDriver>[].obs;
  void getAllDriverDetails(String vehicleType, String id) async {
    loading.value = true;
    await DriverRepo.getDriverDetails(
      vehicleType: vehicleType,
      companyId: id,
      onSuccess: (allDriverDetails) {
        loading.value = false;
        driverDetails.addAll(allDriverDetails);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Driver", message: "Something went wrong!");
      }),
    );
  }
}
