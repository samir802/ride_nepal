import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/widgets/customs/custom_textfield.dart';

class SearchBarScreen extends StatelessWidget {
  SearchBarScreen({super.key});

  final c = Get.put(VehicleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: c.searchController,
                focusNode: c.focusNode,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Perform search action here
                      c.searchMenuItems(c.searchController.text);
                      c.focusNode.unfocus(); // Unfocus the TextField
                    },
                  ),
                ),
                onChanged: (value) {
                  // Update search query here
                  c.searchMenuItems(value);
                },
              ),
            ),
            SizedBox(
              height: 500,
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: c.searchResults.length,
                  itemBuilder: (context, index) {
                    final item = c.searchResults[index];
                    return SizedBox(
                      height: 100,
                      child: Column(
                        children: [Text(item['VehicleBrand'])],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
