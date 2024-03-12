import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/date_time_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';
import 'package:ridenepal/views/Booking_details_scree.dart';
import 'package:ridenepal/widgets/customs/custom_textfield.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class BookingProcess extends StatelessWidget {
  BookingProcess({super.key, required this.vehicles});

  final AllVehicles vehicles;

  final c = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Process"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Date"),
              CustomTextField(
                onTap: () {
                  c.startChooseDate(context);
                },
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
                preIconPath: (Icons.calendar_month),
                controller: c.startDateController,
                hint: "Select Booking Date",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.none,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 28,
              ),
              CustomLargeElevatedButton(
                title: 'Continue',
                onTap: () {
                  Get.to(() => BookingProcessScreen(
                        vehicles: vehicles,
                      ));
                  // String selectedDate = c.startDateController.text;
                  // String selectedTime =
                  //     "${DateTime.now().hour}:${DateTime.now().minute}";

                  // DateTime selectedDateTime =
                  //     DateTime.parse("$selectedDate $selectedTime");
                  // DateTime currentDateTime = DateTime.now();

                  // if (selectedDateTime.isBefore(currentDateTime)) {
                  //   CustomSnackBar.error(
                  //       title: "Time has passed",
                  //       message: "Please choose a new date");
                  // } else {

                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
