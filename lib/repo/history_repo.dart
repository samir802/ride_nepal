import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ridenepal/models/history_model.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/storage_keys.dart';

class HistoryRepo {
  static Future<void> getHistory({
    required Function(List<OrderDetails> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String token = StorageHelper.getToken();
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse("${Api.getHistory}?token=$token"),
        headers: header,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<OrderDetails> vehicles = bookingHistoryFromJson(data["data"]);
        onSuccess(vehicles);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log(e.toString());
      onError("Sorry! something went wrong");
    }
  }
}
