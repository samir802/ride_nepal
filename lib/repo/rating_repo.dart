import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ridenepal/utils/apis.dart';

class AddRatingRepo {
  static Future<void> addRating({
    required String rating,
    required String comment,
    required String userId,
    required String orderId,
    required Function(String successMessage) onSuccess,
    required Function(String successMessage) onError,
  }) async {
    try {
      var headers = {
        "Accept": "applicaation/json",
      };
      var body = {
        "Comment": comment,
        "Rating": rating,
        "user_ID": userId,
        "Order_ID": orderId,
      };
      http.Response response = await http.post(Uri.parse(Api.addRating),
          headers: headers, body: body);

      dynamic data = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"]);
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError("Sorry! something went wrong");
    }
  }
}
