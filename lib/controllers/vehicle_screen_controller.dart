import 'package:get/get.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/repo/vehicle_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';

class VehicleScreenController extends GetxController {
  @override
  void onInit() {
    getVehicle();
    getPopularVehicle();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<AllVehicles> vehicleDetails = <AllVehicles>[].obs;
  RxList<AllVehicles> displayVehicleDetails = <AllVehicles>[].obs;

  getVehicle() async {
    loading.value = true;
    await VehicleRepo.getVehicle(
      onSuccess: (allVehicles) {
        loading.value = false;
        vehicleDetails.addAll(allVehicles);
        // Initially display all vehicles
        // displayVehicleDetails.assignAll(vehicleDetails);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Vehicles", message: message);
      }),
    );
  }

  getPopularVehicle() async {
    loading.value = true;
    await VehicleRepo.getPopularVehicle(
      onSuccess: (allPopularVehicle) {
        loading.value = false;
        displayVehicleDetails.addAll(allPopularVehicle);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Vehicles", message: message);
      }),
    );
  }

  // TextEditingController searchController = TextEditingController();
  // var isTextFieldSelected = false.obs;

  // void filterVehicle(String query) {
  //   if (query.isEmpty) {
  //     displayVehicleDetails.assignAll(vehicleDetails);
  //   } else {
  //     displayVehicleDetails.assignAll(vehicleDetails.where((vehicle) =>
  //         vehicle.vehicleBrand?.toLowerCase().contains(query.toLowerCase()) ??
  //         false));
  //   }
  // }

  // void onSearchQueryChanged(String query) {
  //   filterVehicle(query);
  // }

  // void setIsTextFieldSelected(bool isSelected) {
  //   isTextFieldSelected.value = isSelected;
  // }
}
