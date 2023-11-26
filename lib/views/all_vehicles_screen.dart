import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/customs/elevated_button.dart';

class AllVehicleScreen extends StatelessWidget {
  const AllVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                          const Text(
                            "Mercedes",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                              Text("4 seats", style: TextStyle(fontSize: 15)),
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
                          const Text(
                            "Mercedes",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                              Text("4 seats", style: TextStyle(fontSize: 15)),
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
            ],
          ),
        ),
      ),
    );
  }
}
