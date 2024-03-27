import 'dart:convert';
import 'dart:developer';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:http/http.dart' as http;
import 'package:ridenepal/utils/custom_snackbar.dart';

class VehicleRepo {
  static Future<void> getVehicle({
    required Function(List<AllVehicles> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse(Api.getVehicle),
        headers: header,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<AllVehicles> vehicle = allVehiclesFromJson(data["data"]);
        onSuccess(vehicle);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      CustomSnackBar.error(title: "Vehicle", message: "message");
    }
  }

  static Future<void> getPopularVehicle({
    required Function(List<AllVehicles> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse(Api.getPopularVehicle),
        headers: header,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<AllVehicles> vehicle = allVehiclesFromJson(data["data"]);
        onSuccess(vehicle);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      CustomSnackBar.error(title: "Popular Vehicle", message: "$e");
    }
  }

  static Future<List<Map<String, dynamic>>> searchMenuItems(
      String query) async {
    final response = await http.get(Uri.parse('${Api.searchApi}?value=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      return [];
    }
  }

  static Future<void> searchVehicleItems({
    required Function(List<AllVehicles> category) onSuccess,
    required Function(String message) onError,
    required String query,
  }) async {
    try {
      http.Response response =
          await http.get(Uri.parse('${Api.searchApi}?value=$query'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)["data"];
        List<AllVehicles> vehicles =
            data.map((item) => AllVehicles.fromJson(item)).toList();
        onSuccess(vehicles);
        log("list:${vehicles.toString()}");
      } else {
        onError("Failed to search vehicles");
      }
    } catch (e) {
      onError("An error occurred while searching vehicles: $e");
    }
  }
}
