import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ridenepal/controllers/cancelOrderController.dart';
import 'package:ridenepal/controllers/history_controller.dart';
import 'package:ridenepal/models/history_model.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/custom_text_style.dart';
import 'package:ridenepal/views/order_details.dart';

class History extends StatelessWidget {
  History({super.key});

  final c = Get.put(HistoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.historyDetail.clear();
          c.getAllHistory();
        },
        child: Obx(
          () {
            if (c.loading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (c.historyDetail.isEmpty) {
              return const Center(
                child: Text("No history records available."),
              );
            } else {
              return ListView.builder(
                itemCount: c.historyDetail.length,
                itemBuilder: (context, index) {
                  OrderDetails history = c.historyDetail[index];
                  return HistoryListCard(
                    history: history,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class HistoryListCard extends StatelessWidget {
  HistoryListCard({
    super.key,
    required this.history,
  });

  final OrderDetails history;
  final a = Get.put(CancelOrderController());

  @override
  Widget build(BuildContext context) {
    Color containerColor;

    switch (history.status) {
      case 'Completed':
        containerColor = Colors.green;
        break;
      case 'Pending':
        containerColor = Colors.blue;
        break;
      case 'Cancelled':
        containerColor = Colors.red;
        break;
      default:
        containerColor = Colors.grey; // Setting default color to grey
        break;
    }

    DateTime rentedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(history.rentedDate!);
    Duration difference = DateTime.now().difference(rentedDateTime);
    bool canCancel = difference.inMinutes < 30 && history.status != 'Cancelled';
    bool canReview =
        difference.inMinutes >= 30 && history.status != 'Cancelled';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 6,
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    "${Api.imageFolderPath}${history.vehicleImage}",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      history.vehicleBrand ?? " ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      history.rentedDate ?? "",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Rs ${history.totalPrice ?? ""}",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: containerColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            history.status ?? " ",
                            style: TextStyle(
                              color: containerColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (canCancel)
                          ElevatedButton.icon(
                            onPressed: () {
                              a.onSubmit(history.orderId ?? "");
                            },
                            icon: const Icon(Icons.close),
                            label: const Text("Cancel"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        if (canReview)
                          ElevatedButton.icon(
                            onPressed: () {
                              Get.to(OrderDetailsClass(
                                historyDetails: history,
                              ));
                            },
                            icon: const Icon(Icons.star),
                            label: const Text("Review"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
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
    );
  }
}
