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
      var body = {"email": email, "password": password, "type": "customer"};
      http.Response response = await http.post(Uri.parse(Api.loginUrl),
          headers: headers, body: body);
      dynamic data = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        String accessToken = data["token"].toString();
        User user = User.fromJson(data["user"]);
        onSuccess(user, accessToken);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      onError("$e,$s");
    }
  }
}
