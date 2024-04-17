import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/models/all_driver.dart';
import 'package:ridenepal/utils/apis.dart';

final c = Get.put(CoreController());

class DriverRepo {
  static Future<void> getDriverDetails({
    required String vehicleType,
    required String companyId,
    required Function(List<AllDriver> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse(
            "${Api.getDriverDetails}?VehicleType=$vehicleType&CompanyId=$companyId"),
        headers: header,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<AllDriver> driver = driverFromJson(data["data"]);
        onSuccess(driver);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      onError("$e");
    }
  }
}
