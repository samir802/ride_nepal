import 'package:get/get.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/repo/vehicle_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';

class VehicleScreenController extends GetxController {
  @override
  void onInit() {
    getVehicle();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<AllVehicles> vehicleDetails = <AllVehicles>[].obs;
  getVehicle() async {
    loading.value = true;
    await VehicleRepo.getVehicle(
      onSuccess: (allVehicles) {
        loading.value = false;
        vehicleDetails.addAll(allVehicles);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Vehicles", message: message);
      }),
    );
  }
}
