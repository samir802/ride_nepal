import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ridenepal/models/users.dart';
import 'package:ridenepal/utils/apis.dart';

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required Function(User user, String token) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {"email": email, "password": password, "type": "Customer"};
      http.Response response = await http.post(Uri.parse(Api.loginUrl),
          headers: headers, body: body);

      // Check if response status code indicates success
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Check if response content type is JSON
        if (response.headers['content-type']?.contains('application/json') ??
            false) {
          dynamic data = jsonDecode(response.body);
          String accessToken = data["token"].toString();
          User user = User.fromJson(data["user"]);
          onSuccess(user, accessToken);
        } else {
          // Response is not JSON
          onError("Response is not JSON.");
        }
      } else {
        // Response status code indicates failure
        dynamic data = jsonDecode(response.body);
        onError(data['message']);
      }
    } catch (e, s) {
      // Error occurred
      onError("$e$s");
    }
  }
}
