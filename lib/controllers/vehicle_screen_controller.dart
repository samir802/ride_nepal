import 'package:flutter/material.dart';
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

  final searchResults = List<Map<String, dynamic>>.empty().obs;
  final FocusNode focusNode = FocusNode();
  TextEditingController searchController = TextEditingController();

  Future<void> searchMenuItems(String query) async {
    final data = await VehicleRepo.searchMenuItems(query);
    searchResults.assignAll(data);
  }
}
