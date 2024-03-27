import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/date_time_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/colors.dart';
import 'package:ridenepal/views/payment_screen.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookingProcessScreen extends StatelessWidget {
  BookingProcessScreen({super.key, required this.vehicles});

  final AllVehicles vehicles;
  final c = Get.put(CoreController());
  final dT = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.parse(dT.startDateController.text);
    DateTime returnDate = DateTime.parse(dT.returnDateController.text);
    int differenceInDays = returnDate.difference(startDate).inDays + 1;

    int totalPrice = int.parse(vehicles.price ?? " ") * differenceInDays;

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          vehicles.vehicleBrand ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(vehicles.rating ?? "5"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 200,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Api.imageFolderPath}${vehicles.vehicleImage ?? " "}",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Booking Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Booked Date",
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
                          "Returning Date",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          dT.returnDateController.text,
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
                          "Rent for(days)",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          differenceInDays.toString(),
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
                          "Price (per day)",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Rs ${vehicles.price ?? " "}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Price",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.errorColor,
                          ),
                        ),
                        Text(
                          "Rs ${totalPrice.toString()}",
                          style: const TextStyle(fontSize: 18),
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
                      startDate: dT.startDateController.text,
                      returnDate: dT.returnDateController.text,
                      vehicleId: vehicles.vehicleID.toString(),
                      totalPrice: totalPrice.toString(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
