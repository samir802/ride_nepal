import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/Phone_controller.dart';
import 'package:ridenepal/utils/colors.dart';
import 'package:ridenepal/utils/images_path.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class SpecificationScreen extends StatelessWidget {
  SpecificationScreen({super.key});

  final c = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        title: const Text('Specification'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous page
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mercedes",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "4.5",
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(
                          Icons.star,
                          size: 25,
                          color: Colors.amber,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  height: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://imgd.aeplcdn.com/370x208/n/cw/ec/40432/scorpio-n-exterior-right-front-three-quarter-75.jpeg?isig=0&q=80"),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 206, 224, 239),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const ExpandableText(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam volupt Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam volupt Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam volupt ',
                          style: TextStyle(color: AppColors.textGreyColor),
                          textAlign: TextAlign.justify,
                          expandText: 'Read more',
                          collapseText: 'Read less',
                          maxLines: 2,
                          linkColor: AppColors.secondaryColor1,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: SvgPicture.asset(
                                    ImagePath.seat,
                                  ),
                                ),
                                const Text("7 seats")
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: SvgPicture.asset(
                                    ImagePath.engineCC,
                                  ),
                                ),
                                const Text("2955 cc")
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: SvgPicture.asset(
                                    ImagePath.meter,
                                  ),
                                ),
                                const Text("11 kmpl")
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: SvgPicture.asset(
                                    ImagePath.manual,
                                  ),
                                ),
                                const Text("Manual")
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  // color: Colors.black,
                                  child: SvgPicture.asset(
                                    ImagePath.fuel,
                                  ),
                                ),
                                const Text(
                                  "Diesel",
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Renter",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(ImagePath.renterProfile),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "Shishir Rentals Pvt. Ltd",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: SvgPicture.asset(
                          ImagePath.phone,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(0, 1), // Adjust the offset as needed
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Rs 5000/day",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                  width: 150,
                  child: CustomLargeElevatedButton(
                      title: "Rent Now", onTap: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
