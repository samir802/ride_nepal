import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/views/all_vehicles_screen.dart';
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
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                          const Text("Samir Shrestha",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      const SizedBox(
                        width: 85,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/736x/55/8c/2a/558c2a5e3a5cc81b1961cbe40369e419.jpg"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          hintText: "Search vehicles....",
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
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
                        "For you",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(const AllVehicleScreen());
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
                    height: 160,
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
                          height: 160,
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
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Mercedes",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("4 seats",
                                      style: TextStyle(fontSize: 15)),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Rs 5000/Day",
                                  style: TextStyle(fontSize: 15)),
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
                  const SizedBox(
                    height: 20,
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
