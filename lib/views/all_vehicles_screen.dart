import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class AllVehicleScreen extends StatelessWidget {
  AllVehicleScreen({super.key});

  final c = Get.put(VehicleScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicles"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.vehicleDetails.clear();
          c.getVehicle();
        },
        child: SafeArea(
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
      onTap: () {
        // Get.to(() => SinglePage(
        //       doctors: doctors,
        //     ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(children: [
          Container(
            height: 170,
            width: Get.width,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  width: 160,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cdn.motor1.com/images/mgl/NGGZon/s3/koenigsegg-gemera.jpg")),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            vehicles.vehicleBrand ?? "",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          // const Icon(
                          //   Icons.person,
                          //   size: 25,
                          // ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Text(vehicles.capacity ?? "",
                              style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(vehicles.fuelType ?? "",
                          style: const TextStyle(fontSize: 15)),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 125,
                        child: CustomElevatedButton(
                            title: "Book Now", onTap: () {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
