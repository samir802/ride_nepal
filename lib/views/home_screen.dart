import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/get_profile_controller.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/views/Specification_Screen.dart';
import 'package:ridenepal/views/search_and_filter.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final c = Get.put(CoreController());
  final d = Get.put(VehicleScreenController());
  final e = Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {
    RxList<AllVehicles> vehicleDetails = d.vehicleDetails;
    List<String> imgList = List<String>.from(vehicleDetails
        .map((vehicle) => "${Api.baseUrl}/uploads/${vehicle.vehicleImage}"));

    // Sort the most rented vehicles alphabetically
    List<AllVehicles> sortedMostRentedVehicles =
        List<AllVehicles>.from(d.mostRentedVehicleDetails)
          ..sort((a, b) => a.vehicleBrand!.compareTo(b.vehicleBrand!));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async {
              d.displayVehicleDetails.clear();
              d.getPopularVehicle();
            },
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getGreeting(),
                            style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(() => SearchAndFilter());
                    },
                    child: Container(
                      width: Get.width,
                      height: 50,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.search),
                          SizedBox(width: 20),
                          Text(
                            "Search Vehicles...",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 125.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: imgList.map(
                      (item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.network(
                                item,
                                fit: BoxFit.fill,
                                height: 50,
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "For You",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 160,
                    width: Get.width,
                    color: Colors.white,
                    child: Obx(
                      () => d.loading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: d.displayVehicleDetails.length,
                              itemBuilder: (context, index) {
                                AllVehicles vehicles =
                                    d.displayVehicleDetails[index];
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                      )),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: VehicleListCardHome(
                                    vehicles: vehicles,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Most Rented",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 160,
                    width: Get.width,
                    color: Colors.white,
                    child: Obx(
                      () => d.loading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sortedMostRentedVehicles.length,
                              itemBuilder: (context, index) {
                                AllVehicles vehicles =
                                    sortedMostRentedVehicles[index];
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                      )),
                                  margin: const EdgeInsets.only(right: 10),
                                  child: VehicleListCardHome(
                                    vehicles: vehicles,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VehicleListCardHome extends StatelessWidget {
  const VehicleListCardHome({
    super.key,
    required this.vehicles,
  });

  final AllVehicles vehicles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Container(
              height: Get.height,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                          "${Api.imageFolderPath}${vehicles.vehicleImage}"))),
            ),
          ),
          SizedBox(
            height: Get.height,
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        vehicles.vehicleBrand ?? "Brand Name",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          vehicles.rating ?? " ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    Text(
                      "${vehicles.capacity} seats",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Rs ${vehicles.price}/day",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomLargeElevatedButton(
                    title: "Book",
                    onTap: () {
                      Get.to(SpecificationScreen(vehicles: vehicles));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getGreeting() {
  DateTime now = DateTime.now();
  int hour = now.hour;

  if (hour < 12) {
    return 'Goodmorning! 🌄';
  } else if (hour < 17) {
    return 'Goodafternoon! ☀️';
  } else if (hour < 21) {
    return 'Goodevening! 🌒';
  } else {
    return 'Goodnight! 💤';
  }
}
