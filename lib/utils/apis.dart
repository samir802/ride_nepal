class Api {
  static const String baseUrl = "http://192.168.1.66/RideShare-admin";

  static const String loginUrl = "$baseUrl/api/login.php";
  static const String registerUrl = "$baseUrl/api/register_user.php";

  static const String getVehicle = "$baseUrl/api/vehicles.php";
  static const String addBooking = "$baseUrl/api/store_order.php";
  static const String getHistory = "$baseUrl/api/get_order.php";
  static const String getProfileDetails = "$baseUrl/api/get_profile.php";
}
