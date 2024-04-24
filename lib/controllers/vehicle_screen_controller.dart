import 'package:get/get.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/repo/vehicle_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';

class VehicleScreenController extends GetxController {
  @override
  void onInit() {
    getVehicle();
    getPopularVehicle();
    getMostRentedVehicle();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<AllVehicles> vehicleDetails = <AllVehicles>[].obs;
  RxList<AllVehicles> displayVehicleDetails = <AllVehicles>[].obs;
  RxList<AllVehicles> searchVehicle = <AllVehicles>[].obs;
  RxList<AllVehicles> mostRentedVehicleDetails = <AllVehicles>[].obs;

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
        displayVehicleDetails.assignAll(allPopularVehicle);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Vehicles", message: message);
      }),
    );
  }

  getMostRentedVehicle() async {
    loading.value = true;
    await VehicleRepo.getMostRentedVehicle(
      onSuccess: (allPopularVehicle) {
        loading.value = false;
        mostRentedVehicleDetails.assignAll(allPopularVehicle);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Vehicles", message: message);
      }),
    );
  }

  void filterVehicle(String query) {
    if (query.isEmpty) {
      searchVehicle.assignAll(vehicleDetails);
    } else {
      searchVehicle.assignAll(vehicleDetails.where((vehicle) =>
          vehicle.vehicleBrand?.toLowerCase().contains(query.toLowerCase()) ??
          false));
    }
  }

  final RxString activeType = ''.obs;
  void filterVehicleByType(String type) {
    if (type == 'Car') {
      searchVehicle.assignAll(vehicleDetails
          .where((vehicle) => vehicle.vehicleType == 'Car')
          .toList());
    } else if (type == 'Motorcycle') {
      searchVehicle.assignAll(vehicleDetails
          .where((vehicle) => vehicle.vehicleType == 'Motorcycle')
          .toList());
    } else if (type == 'Scooter') {
      searchVehicle.assignAll(vehicleDetails
          .where((vehicle) => vehicle.vehicleType == 'Scooter')
          .toList());
    } else if (type == 'Jeep') {
      searchVehicle.assignAll(vehicleDetails
          .where((vehicle) => vehicle.vehicleType == 'Jeep')
          .toList());
    }
    activeType.value = type;
  }

  bool isActive(String type) {
    return activeType.value == type;
  }

  void deactivatePreviousType(String currentType) {
    final previousType = activeType.value;
    if (previousType != currentType) {
      activeType.value = '';
    }
  }

  void sortByHighestPrice() {
    searchVehicle.sort((a, b) {
      if (a.price == null) return 1;
      if (b.price == null) return -1;
      return b.price!.compareTo(a.price!);
    });
  }

  void sortByLowestPrice() {
    searchVehicle.sort((a, b) {
      if (a.price == null) return -1;
      if (b.price == null) return 1;
      return a.price!.compareTo(b.price!);
    });
  }

  void sortByHighestRating() {
    searchVehicle.sort((a, b) => b.rating!.compareTo(a.rating!));
  }

  void sortByLowestRating() {
    searchVehicle.sort((a, b) => a.rating!.compareTo(b.rating!));
  }
}
