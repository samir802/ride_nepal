import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:ridenepal/utils/apis.dart';

// class RegisterRepo {
//   static Future<void> register({
//     required String email,
//     required String name,
//     required String phoneNumber,
//     required String address,
//     required String password,
//     required File? imageFile,
//     required Function(String successMessage) onSuccess,
//     required Function(String errorMessage) onError,
//   }) async {
//     try {
//       var uri = Uri.parse(Api.registerUrl);
//       var request = http.MultipartRequest("POST", uri);

//       if (imageFile != null) {
//         var stream = http.ByteStream(imageFile.openRead());
//         var length = await imageFile.length();
//         var multipartFile = http.MultipartFile(
//           "image",
//           stream,
//           length,
//           filename: basename(imageFile.path),
//         );
//         request.files.add(multipartFile);
//       } else {
//         // Add a placeholder field for image if imageFile is null
//         request.fields['image'] = 'null';
//       }

//       request.fields.addAll({
//         "name": name,
//         "phone": phoneNumber,
//         "address": address,
//         "email": email,
//         "password": password,
//         "type": "Customer",
//       });

//       var response = await request.send();
//       var responseBody = await response.stream.bytesToString();

//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         // Check if response content type is JSON
//         if (response.headers['content-type']?.contains('application/json') ??
//             false) {
//           dynamic data = jsonDecode(responseBody);
//           if (data.containsKey("error")) {
//             onError(data["error"]);
//           } else {
//             onSuccess("Registration successful");
//           }
//         }
//       } else {
//         onError("Registration failed");
//       }
//     } catch (e) {
//       onError("Sorry! something went wrong");
//     }
//   }
// }
class RegisterRepo {
  static Future<void> register({
    required String email,
    required String name,
    required String phoneNumber,
    required String address,
    required String password,
    required File? imageFile,
    required Function(String successMessage) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      var uri = Uri.parse(Api.registerUrl);
      var request = http.MultipartRequest("POST", uri);

      if (imageFile != null) {
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile(
          "image",
          stream,
          length,
          filename: basename(imageFile.path),
        );
        request.files.add(multipartFile);
      } else {
        // Add a placeholder field for image if imageFile is null
        request.fields['image'] = 'null';
      }

      request.fields.addAll({
        "name": name,
        "phone": phoneNumber,
        "address": address,
        "email": email,
        "password": password,
        "type": "Customer",
      });

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      dynamic data = jsonDecode(responseBody);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Check if response content type is JSON
        if (response.headers['content-type']?.contains('application/json') ??
            false) {
          if (data.containsKey("status")) {
            if (data["status"] == "error" && data.containsKey("message")) {
              if (data["message"] == "Email already exists") {
                onError("Email already exists");
              } else {
                onError(data["message"]);
              }
            } else {
              onSuccess("Registration successful");
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
      onError("Sorry! something went wrong");
    }
  }
}
