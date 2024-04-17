import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ridenepal/utils/apis.dart';

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
          // Check if data contains status and message

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
