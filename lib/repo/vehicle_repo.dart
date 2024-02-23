import 'dart:convert';

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
      CustomSnackBar.error(title: "Login", message: "Something went wrong!");
    }
  }
}
