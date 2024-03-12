import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/date_time_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/colors.dart';
import 'package:ridenepal/views/payment_screen.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class BookingProcessScreen extends StatelessWidget {
  BookingProcessScreen({super.key, required this.vehicles});

  final AllVehicles vehicles;
  final c = Get.put(CoreController());
  final dT = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vehicles.vehicleBrand ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 200,
                    child: CachedNetworkImage(
                        imageUrl:
                            "${Api.baseUrl}/uploads/${vehicles.image ?? " "}"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Booking Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        dT.startDateController.text,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Price(per day)",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        vehicles.price ?? " ",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Driver(per day)",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "0",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rent for(days)",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "4",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 18, color: AppColors.errorColor),
                      ),
                      // Obx(() => Text(vehicles.price ?? " " * 4)),
                      Text(
                        "12000",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomLargeElevatedButton(
                  title: "Continue",
                  onTap: () {
                    Get.to(PaymentScreen(
                        date: dT.startDateController.text,
                        vehicleId: vehicles.vehicleID.toString()));
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
