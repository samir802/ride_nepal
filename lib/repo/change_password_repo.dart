import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/utils/apis.dart';

final c = Get.put(CoreController());

class ChangePasswordRepo {
  // static Future<void> sendOTP({
  //   required String email,
  //   required Function(String successMessage) onSuccess,
  //   required Function(String errorMessage) onError,
  // }) async {
  //   try {
  //     var headers = {
  //       "Accept": "application/json",
  //     };
  //     var body = {
  //       "email": email,
  //     };
  //     http.Response response =
  //         await http.post(Uri.parse(Api.sendOtp), headers: headers, body: body);

  //     // Extract JSON portion from response body using regular expression
  //     final responseString = response.body;
  //     final jsonMatch = RegExp(r'{[^{}]*}').firstMatch(responseString);
  //     final jsonBody = jsonMatch?.group(0);

  //     if (jsonBody != null) {
  //       dynamic data = jsonDecode(jsonBody);

  //       if (response.statusCode >= 200 && response.statusCode < 300) {
  //         onSuccess(data["message"]);
  //       } else {
  //         onError(data["message"]);
  //       }
  //     } else {
  //       // Handle case where JSON portion is not found in response body
  //       onError("Failed to parse JSON response");
  //     }
  //   } catch (e) {
  //     onError("Sorry! something went wrong $e");
  //   }
  // }
  static Future<void> changeProfilePassword({
    required String oldpassword,
    required String newpassword,
    required Function(String successMessage) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "oldPassword": oldpassword,
        "newPassword": newpassword,
        "userId": c.currentUser.value?.id
      };
      http.Response response = await http.post(
          Uri.parse(Api.chnageProfilePassword),
          headers: headers,
          body: body);
      dynamic data = jsonDecode(response.body);

      // Check if response status code indicates success
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.headers['content-type']?.contains('application/json') ??
            false) {
          if (data.containsKey("status")) {
            if (data["status"] == "error" && data.containsKey("message")) {
              if (data["message"] == "Old password is incorrect") {
                onError("Old password is incorrect");
              } else {
                onError(data["message"]);
              }
            } else {
              onSuccess(data['message']);
            }
          }
        } else {
          // Response is not JSON
          onError("Response is not JSON.");
        }
      } else {
        onError(data['message']);
      }
    } catch (e) {
      // If an error occurs, return the error message
      onError("Sorry! Something went wrong: $e");
      log("$e");
    }
  }

  static Future<void> sendOTP({
    required String email,
    required Function(String successMessage) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "email": email,
      };
      http.Response response =
          await http.post(Uri.parse(Api.sendOtp), headers: headers, body: body);

      // Extract JSON portion from response body using regular expression
      final responseString = response.body;
      final jsonMatch = RegExp(r'{[^{}]*}').firstMatch(responseString);
      final jsonBody = jsonMatch?.group(0);

      if (jsonBody != null) {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          if (response.headers['content-type']?.contains('application/json') ??
              false) {
            dynamic data = jsonDecode(jsonBody);
            onSuccess(data["message"]);
            // log(data['data']);
          }
          // if (data.containsKey('status') && data['status'] == 'success') {
          //   onSuccess(data["message"]);
          // } else {
          //   onError(data["message"]);
          // }
        } else {
          dynamic data = jsonDecode(jsonBody);

          onError(data["message"]);
        }
      } else {
        // Handle case where JSON portion is not found in response body
        onError("Failed to parse JSON response");
      }
    } catch (e) {
      onError("Sorry! something went wrong $e");
      log("$e");
    }
  }

  static Future<void> verifyOTP({
    required String otp,
    required String email,
    required Function(String successMessage) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    log(otp);
    try {
      var headers = {
        "Accept": "application/json", // Specify JSON content type
      };
      var body = {
        "otp": otp,
        "email": email,
      };
      http.Response response = await http.post(Uri.parse(Api.verifyOTP),
          headers: headers, body: body);

      // Check the status code of the response
      if (response.statusCode == 200) {
        final responseString = response.body;
        final jsonData = jsonDecode(responseString);
        print(jsonData['message']);

        // Check if status is "Success" or "Error"
        if (jsonData['status'] == 'Success') {
          onSuccess(jsonData['message']);
        } else {
          onError(jsonData['message']);
        }
      } else {
        // If the response status code is not 200 (OK), handle it as an error
        onError(
            "Failed to verify OTP. Server responded with status: ${response.statusCode}");
      }
    } catch (e) {
      onError("Sorry! Something went wrong: $e");
      log("$e");
    }
  }

  static Future<void> changePassword({
    required String password,
    required String email,
    required Function(String successMessage) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    log(password);
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "password": password,
        "email": email,
      };
      http.Response response = await http.post(Uri.parse(Api.changePassword),
          headers: headers, body: body);

      dynamic data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess(data["message"]);
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError("Sorry! something went wrong $e");
      log("$e");
    }
  }
}
