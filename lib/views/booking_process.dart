import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/date_time_controller.dart';
import 'package:ridenepal/controllers/get_driver_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/views/Booking_details_screen.dart';
import 'package:ridenepal/widgets/customs/custom_textfield.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class BookingProcess extends StatelessWidget {
  BookingProcess({super.key, required this.vehicles});

  final AllVehicles vehicles;

  final c = Get.put(DateTimeController());
  final d = Get.put(GetDriverController());

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
              const Text("Booking Date:"),
              CustomTextField(
                onTap: () {
                  c.startChooseDateTime(context);
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
                height: 10,
              ),
              const Text("Returning Date:"),
              CustomTextField(
                onTap: () {
                  c.returnChooseDateTime(context);
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
                controller: c.returnDateController,
                hint: "Select Returning Date",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.none,
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () => CheckboxListTile(
                  title: const Text("Driver(if needed)"),
                  value: d.driverSelected.value,
                  onChanged: (newValue) {
                    d.driverSelected.value = newValue ?? false;
                    if (newValue ?? false) {
                      d.getAllDriverDetails(vehicles.vehicleType ?? " ",
                          vehicles.companyId ?? "");
                    } else {
                      // Clear driver details if deselected
                      d.driverDetails.clear();
                    }
                  },
                ),
              ),
              CustomLargeElevatedButton(
                title: 'Continue',
                onTap: () {
                  Get.to(
                    () => BookingProcessScreen(
                      vehicles: vehicles,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
