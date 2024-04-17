import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/Phone_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/image_path.dart';
import 'package:ridenepal/views/booking_process.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SpecificationScreen extends StatelessWidget {
  SpecificationScreen({super.key, required this.vehicles});

  final c = Get.put(PhoneController());
  final AllVehicles vehicles;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vehicles.vehicleBrand ?? "",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          vehicles.rating ?? "5.0",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Icon(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 3,
                    imageUrl:
                        ("${Api.imageFolderPath}${vehicles.vehicleImage ?? " "}"),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/phone.svg',
                      height: MediaQuery.of(context).size.height / 2.7,
                      fit: BoxFit.contain,
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        ExpandableText(
                          vehicles.vehicleInfo ?? '',
                          style: const TextStyle(color: Colors.grey),
                          textAlign: TextAlign.justify,
                          expandText: 'Read more',
                          collapseText: 'Read less',
                          maxLines: 2,
                          linkColor: Colors.blue,
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
                                Text("${vehicles.capacity ?? " "} seats")
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
                                Text("${vehicles.engineCapacity ?? " "} cc")
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
                                Text("${vehicles.fuelConsumption ?? " "} kmpl")
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
                                Text(vehicles.drivingMethod ?? " ")
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: SvgPicture.asset(
                                    ImagePath.fuel,
                                  ),
                                ),
                                Text(
                                  vehicles.fuelType ?? " ",
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
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: Get.width,
                            height: MediaQuery.of(context).size.height / 2.3,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Company",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          "${Api.imageFolderPath}${vehicles.companyLogo}",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            vehicles.companyName ?? " ",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(vehicles.email ?? ""),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Owner",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          "${Api.imageFolderPath}${vehicles.image}",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            vehicles.name ?? " ",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(vehicles.phone ?? ""),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(vehicles.address ?? ""),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomLargeElevatedButton(
                                      title: "Call",
                                      onTap: () {
                                        c.launchPhoneNumber(
                                            vehicles.phone ?? " ");
                                      }),
                                ]),
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: CachedNetworkImageProvider(
                            "${Api.imageFolderPath}${vehicles.image}"),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vehicles.companyName ?? " ",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(vehicles.address ?? "")
                        ],
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
              Text(
                "Rs ${vehicles.price ?? " "}/day",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 150,
                child: CustomLargeElevatedButton(
                  title: "Rent Now",
                  onTap: () {
                    Get.to(
                      () => BookingProcess(
                        vehicles: vehicles,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
