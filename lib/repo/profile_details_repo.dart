import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/get_profile_controller.dart';
import 'package:ridenepal/models/profile_details.dart';
import 'package:ridenepal/utils/apis.dart';

final c = Get.put(CoreController());

class ProfileDetailsRepo {
  static Future<void> getProfileDetails({
    required Function(List<ProfileDetails> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse("${Api.getProfileDetails}?token=${c.userToken}"),
        headers: header,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<ProfileDetails> profile = profileDetailsFromJson(data["data"]);
        onSuccess(profile);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      onError("Sorry! something went wrong");
    }
  }

  static Future<void> updateProfile({
    required String email,
    required String name,
    required String phone,
    required String address,
    required Function(String successMessage) onSuccess,
    required Function(String successMessage) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "name": name,
        "phone": phone,
        "address": address,
        "email": email,
      };
      http.Response response = await http.post(
          Uri.parse("${Api.updateProfile}?token=${c.userToken}"),
          headers: headers,
          body: body);

      dynamic data = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"]);
        await getProfileDetails(
          onSuccess: (profile) {
            Get.find<GetProfileController>().profileDetails.assignAll(profile);
          },
          onError: (message) {},
        );
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError("Something went wrong!");
    }
  }
}
