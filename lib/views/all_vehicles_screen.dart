import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/views/Specification_Screen.dart';

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
        child: Obx(
          () => c.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
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
      onTap: () {
        Get.to(() => SpecificationScreen(
              vehicles: vehicles,
            ));
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              )
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: Get.width,
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: "${Api.baseUrl}/uploads/${vehicles.vehicleImage}"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicles.vehicleBrand ?? " ",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rs ${vehicles.price ?? " "}/day",
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
