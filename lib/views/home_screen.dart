import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/views/Specification_Screen.dart';
import 'package:ridenepal/views/all_vehicles_screen.dart';
import 'package:ridenepal/views/search_bar_screen.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

final List<String> imgList = [
  'https://hips.hearstapps.com/hmg-prod/images/dw-burnett-pcoty22-8260-1671143390.jpg',
  'https://img.freepik.com/free-photo/blue-black-muscle-car-with-license-plate-that-says-trans-front_1340-23399.jpg?size=626&ext=jpg&ga=GA1.1.1880011253.1699401600&semt=ais',
  'https://imgd.aeplcdn.com/664x374/n/cw/ec/40087/thar-exterior-right-front-three-quarter-32.jpeg?q=80',
  'https://imgd.aeplcdn.com/664x374/n/cw/ec/150705/glc-exterior-right-front-three-quarter-94.jpeg?isig=0&q=80',
  'https://www.joyebike.com/product/beast/images/banner-img-mobile.png',
  'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/1-mercedes-benz-g-class-2019-rt-hero-front.jpg?itok=kG4plfw1'
];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final c = Get.put(CoreController());
  final d = Get.put(VehicleScreenController());

  @override
  Widget build(BuildContext context) {
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
                          Text(c.currentUser.value?.name ?? "",
                              style: const TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                      onTap: () {
                        Get.to(SearchBarScreen());
                      },
                      child: Container(
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: const Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.search),
                            SizedBox(width: 20),
                            Text(
                              "Search Vehicles...",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 125.0,
                      autoPlay: true,
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
                                fit: BoxFit.cover,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Top Rated",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(AllVehicleScreen());
                          },
                          child: const Text(
                            "See all",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 180,
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
                  "Rs${vehicles.price}/day",
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
