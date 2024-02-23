import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/views/Specification_Screen.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class AllVehicleScreen extends StatelessWidget {
  AllVehicleScreen({super.key});

  final c = Get.put(VehicleScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vehicles",
        ),
        shadowColor: Colors.blueGrey,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.vehicleDetails.clear();
          c.getVehicle();
        },
        child: Obx(
          () => c.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: c.vehicleDetails.length,
                  itemBuilder: (context, index) {
                    AllVehicles vehicles = c.vehicleDetails[index];
                    return VehicleListCard(
                      vehicles: vehicles,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class VehicleListCard extends StatelessWidget {
  const VehicleListCard({super.key, required this.vehicles});

  final AllVehicles vehicles;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 220, 218, 218),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 20,
                            child: Text(
                              vehicles.vehicleBrand ?? "",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 30,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      width: Get.width,
                      child: const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://cdn.motor1.com/images/mgl/NGGZon/s3/koenigsegg-gemera.jpg"),
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          constraints:
                              const BoxConstraints(maxHeight: double.infinity),
                          child: const Text(
                            "Price/day",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            height: 50,
                            width: 150,
                            constraints: const BoxConstraints(
                                maxHeight: double.infinity),
                            child: CustomMediumElevatedButton(
                                title: "Book Now",
                                onTap: () {
                                  Get.to(SpecificationScreen());
                                })),
                      ],
                    ),
                  ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
        ]),
      ),
    );
  }
}
