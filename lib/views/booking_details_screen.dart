import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/date_time_controller.dart';
import 'package:ridenepal/controllers/get_driver_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/views/payment_screen.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class BookingProcessScreen extends StatelessWidget {
  BookingProcessScreen({super.key, required this.vehicles});

  final AllVehicles vehicles;
  final c = Get.put(CoreController());
  final dT = Get.put(DateTimeController());
  final getDriverController = Get.put(GetDriverController());

  int driverPrice = 0;

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.parse(dT.startDateController.text);
    DateTime returnDate = DateTime.parse(dT.returnDateController.text);
    int differenceInDays = returnDate.difference(startDate).inDays + 1;

    int vehicleTotalPrice = int.parse(vehicles.price ?? " ");

    if (getDriverController.driverDetails.isNotEmpty) {
      for (var driver in getDriverController.driverDetails) {
        driverPrice = int.parse(driver.price ?? '0');
      }
    }

    int totalPrice = (vehicleTotalPrice + driverPrice) * differenceInDays;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                              fontSize: 24,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                vehicles.rating ?? "5",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
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
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            dT.startDateController.text,
                            style: const TextStyle(fontSize: 16),
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
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            dT.returnDateController.text,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (getDriverController.driverDetails.isNotEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  getDriverController.toggleDriverDetails();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Driver Details",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Icon(
                                      getDriverController
                                              .showDriverDetails.value
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                    ),
                                  ],
                                ),
                              ),
                              if (getDriverController.showDriverDetails.value)
                                for (var driver
                                    in getDriverController.driverDetails)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Name",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            "${driver.driverName}",
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Phone",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            "${driver.phone}",
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Address",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            "${driver.address}",
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                      const Text(
                        "Billing Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Vehicle Price (per day)",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Rs ${vehicles.price ?? " "}",
                            style: const TextStyle(fontSize: 16),
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
                            "Driver Price (per day)",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Rs $driverPrice",
                            style: const TextStyle(fontSize: 16),
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
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            differenceInDays.toString(),
                            style: const TextStyle(fontSize: 16),
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
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Rs ${totalPrice.toString()}",
                            style: const TextStyle(fontSize: 16),
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
      ),
    );
  }
}
