import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/add_Rating_Controller.dart';
import 'package:ridenepal/controllers/core_controller.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/models/history_model.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class OrderDetailsClass extends StatelessWidget {
  OrderDetailsClass({super.key, required this.historyDetails});

  final OrderDetails historyDetails;
  final c = Get.put(CoreController());
  final d = Get.put(AddRatingController());
  final e = Get.put(VehicleScreenController());

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.parse(historyDetails.rentedDate ?? "");
    DateTime returnDate = DateTime.parse(historyDetails.returnDate ?? "");
    int differenceInDays = returnDate.difference(startDate).inDays + 1;
    String orderId = historyDetails.orderId ?? "";
    String userId = c.currentUser.value?.id ?? "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                historyDetails.vehicleBrand ?? "",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CachedNetworkImage(
                imageUrl:
                    "${Api.imageFolderPath}${historyDetails.vehicleImage}",
              ),
              const SizedBox(height: 10),
              const Text(
                "Order Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Booked Date: ${historyDetails.rentedDate ?? ""}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(
                "Rented for: $differenceInDays days",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(
                "Total Price: Rs ${historyDetails.totalPrice}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Give Review",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Form(
                        key: d.formKey,
                        child: Obx(
                          () => Row(
                            children: List.generate(5, (index) {
                              return IconButton(
                                onPressed: () {
                                  if (index + 1 == d.currentRating.value) {
                                    d.updateRating(0);
                                  } else {
                                    d.updateRating(index + 1);
                                  }
                                },
                                icon: Icon(
                                  index < d.currentRating.value
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: index < d.currentRating.value
                                      ? Colors.amber
                                      : Colors.black,
                                  size: 30,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: d.comment,
                        decoration: const InputDecoration(
                          labelText: 'Comment (optional)',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 10),
                      CustomLargeElevatedButton(
                        onTap: () {
                          d.onSubmit(d.currentRating.value,
                              d.comment.value.text, userId, orderId);
                          d.comment.clear();
                        },
                        title: 'Submit Review',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
