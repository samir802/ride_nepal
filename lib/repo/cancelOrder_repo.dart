import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ridenepal/utils/apis.dart';

class CancelOrderRepo {
  static Future<void> cancelOrder({
    required String orderID,
    required Function(String successMessage) onSuccess,
    required Function(String successMessage) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "id": orderID,
      };
      http.Response response = await http.post(Uri.parse(Api.cancelOrder),
          headers: headers, body: body);

      dynamic data = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"]);
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError("$e");
    }
  }
}
