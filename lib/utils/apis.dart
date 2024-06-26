class Api {
  static const String baseUrl = "http://10.0.2.2/RideNepal-admin";

  static const String imageFolderPath = "$baseUrl/uploads/";
  static const String loginUrl = "$baseUrl/api/login.php";
  static const String chnageProfilePassword =
      "$baseUrl/api/forget_password.php";
  static const String registerUrl = "$baseUrl/api/register_user.php";
  static const String getVehicle = "$baseUrl/api/vehicles.php";
  static const String getPopularVehicle = "$baseUrl/api/popularVehicle.php";
  static const String getMostRentedVehicle =
      "$baseUrl/api/get_most_rented_vehicle.php";
  static const String addRating = "$baseUrl/api/addRating.php";
  static const String addBooking = "$baseUrl/api/store_order.php";
  static const String getHistory = "$baseUrl/api/get_order.php";
  static const String cancelOrder = "$baseUrl/api/cancel_order.php";
  static const String getProfileDetails = "$baseUrl/api/get_profile.php";
  static const String sendOtp = "$baseUrl/api/send_otp.php";
  static const String changePassword = "$baseUrl/api/change_password.php";
  static const String verifyOTP = "$baseUrl/api/verifyOTP.php";
  static const String getDriverDetails = "$baseUrl/api/get_driver.php";
  static const String updateProfile = "$baseUrl/api/update_profile.php";
  static const String searchApi = "$baseUrl/api/search.php";
}
