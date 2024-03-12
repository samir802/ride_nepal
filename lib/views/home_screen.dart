import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/utils/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
        child: SingleChildScrollView(
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
                      Get.to(const SearchBarScreen());
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
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: imgList.map(
                    (item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
                      "For you",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  height: 150,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 195, 215, 248),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          2.0,
                          2.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height,
                        width: Get.width / 2.3,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mike-bird-170811.jpg&fm=jpg"))),
                      ),
                      SizedBox(
                        height: Get.height,
                        width: Get.width / 2.16,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Mercedes",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(children: [
                                Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "4 Seats",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Rs 5000/day",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: CustomLargeElevatedButton(
                                        title: "Book Now",
                                        onTap: () {
                                          // Get.to(SpecificationScreen());
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: AppColors.primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
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
    return 'Goodnight!';
  }
}
