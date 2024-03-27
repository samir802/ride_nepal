import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import DateFormat from intl package

class DateTimeController extends GetxController {
  final dateKeys = GlobalKey<FormState>();

  TextEditingController startDateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();

  var startSelectedDateTime = DateTime.now().obs;
  var returnSelectedDateTime = DateTime.now().obs;

  startChooseDateTime(BuildContext context) async {
    DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );
    if (pickedDateTime != null) {
      // Extract current time details
      DateTime currentTime = DateTime.now();
      int currentHour = currentTime.hour;
      int currentMinute = currentTime.minute;
      int currentSecond = currentTime.second;

      // Set selected date with current time details
      DateTime selectedDateTime = DateTime(
        pickedDateTime.year,
        pickedDateTime.month,
        pickedDateTime.day,
        currentHour, // Current hour
        currentMinute, // Current minute
        currentSecond, // Current second
      );
      startSelectedDateTime.value = selectedDateTime;
      startDateController.text =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDateTime);
    }
  }

  returnChooseDateTime(BuildContext context) async {
    DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );
    if (pickedDateTime != null) {
      DateTime selectedDateTime = DateTime(
        pickedDateTime.year,
        pickedDateTime.month,
        pickedDateTime.day,
      );
      returnSelectedDateTime.value = selectedDateTime;
      returnDateController.text =
          DateFormat('yyyy-MM-dd').format(selectedDateTime);
    }
  }
}
