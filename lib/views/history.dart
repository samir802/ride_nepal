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
        title: const Text("History"),
        centerTitle: true,
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
    Color textColor;

    switch (history.status) {
      case 'Completed':
        containerColor = Colors.green;
        textColor = Colors.white;
        break;
      case 'Pending':
        containerColor = Colors.blue;
        textColor = Colors.white;
        break;
      case 'Cancelled':
        containerColor = Colors.red;
        textColor = Colors.white;
        break;
      default:
        containerColor = Colors.grey; // Setting default color to grey
        textColor = Colors.black;
        break;
    }

    DateTime rentedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(history.rentedDate!);
    Duration difference = DateTime.now().difference(rentedDateTime);

    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 20),
      child: InkWell(
        onTap: () {
          if (difference.inMinutes >= 30 ||
              (history.status == 'Cancelled' && difference.inMinutes < 30)) {
            Get.to(OrderDetailsClass(historyDetails: history));
          }
        },
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 9,
                color: const Color(0xFF494949).withOpacity(0.5),
              )
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        "${Api.imageFolderPath}${history.vehicleImage}",
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${history.name ?? ""}",
                    style: CustomTextStyles.f14W400(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Email: ${history.email ?? ""}",
                    style: CustomTextStyles.f14W400(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Total Price: ${history.totalPrice ?? ""}",
                    style: CustomTextStyles.f14W400(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 85,
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              history.status ?? " ",
                              style: TextStyle(color: textColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (history.status != 'Cancelled' &&
                          difference.inMinutes < 30)
                        InkWell(
                          onTap: () {
                            a.onSubmit(history.orderId ?? "");
                          },
                          child: Container(
                            width: 80,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.close,
                                    size: 23,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
