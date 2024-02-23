import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneController extends GetxController {
  void launchPhoneNumber() async {
    const phoneNumber = "9825149182";
    String dialerUri = 'tel:$phoneNumber';

    // ignore: deprecated_member_use
    if (await canLaunch(dialerUri)) {
      // ignore: deprecated_member_use
      await launch(dialerUri);
    } else {
      throw 'Could not launch $dialerUri';
    }
  }
}