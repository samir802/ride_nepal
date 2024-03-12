import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/history_controller.dart';
import 'package:ridenepal/models/history_model.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/utils/custom_text_style.dart';

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
          () => c.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: c.historyDetail.length,
                  itemBuilder: (context, index) {
                    OrderDetails history = c.historyDetail[index];
                    return HistoryListCard(
                      history: history,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class HistoryListCard extends StatelessWidget {
  const HistoryListCard({
    super.key,
    required this.history,
  });

  final OrderDetails history;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 20),
      child: Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 9,
                  color: const Color(0xFF494949).withOpacity(0.06),
                )
              ]),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: CachedNetworkImage(
                  imageUrl:
                      "${Api.baseUrl}/uploads/${history.vehicleimage ?? " "}",
                  colorBlendMode: BlendMode.srcATop,
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
                    height: 9,
                  ),
                  Text(
                    "Email: ${history.email ?? ""}",
                    style: CustomTextStyles.f14W400(),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Total Price: ${history.totalPrice ?? ""}",
                    style: CustomTextStyles.f14W400(),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
