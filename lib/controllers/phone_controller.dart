import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PhoneController extends GetxController {
  void launchPhoneNumber(String phoneNumber) async {
    // const phoneNumber = "9825149182";
    String dialerUri = "tel:$phoneNumber";
    if (dialerUri != " ") {
      await launchUrlString(dialerUri);
    } else {
      throw 'Could not launch $dialerUri';
    }
  }
}
