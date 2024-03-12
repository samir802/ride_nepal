import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ridenepal/models/profile_details.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/storage_keys.dart';

class ProfileDetailsRepo {
  static Future<void> getProfileDetails({
    required Function(List<ProfileDetails> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String token = StorageHelper.getToken();
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse("${Api.getProfileDetails}?token=$token"),
        headers: header,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<ProfileDetails> vehicles = profileDetailsFromJson(data["data"]);
        onSuccess(vehicles);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      onError("Sorry! something went wrong $e");
    }
  }
}
