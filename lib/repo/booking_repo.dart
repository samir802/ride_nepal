import 'dart:convert';
import '../utils/apis.dart';

import 'package:http/http.dart' as http;

import '../utils/httpRequest.dart';
import '../utils/storage_keys.dart';

class BookingRepo {
  static Future<void> addBooking({
    required String vehicleId,
    required String startDate,
    required String returnDate,
    required String totalPrice,
    required Function() onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var token = StorageHelper.getToken();
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "vehicleId": vehicleId,
        "token": token,
        "startDate": startDate,
        "returnDate": returnDate,
        "totalPrice": totalPrice,
        "status": "Pending",
      };
      http.Response response = await HttpRequest.post(Uri.parse(Api.addBooking),
          headers: headers, body: body);

      dynamic data = jsonDecode(response.body);
      if (data["success"] == true) {
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError("Sorry something went wrong");
    }
  }
}
