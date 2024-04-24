import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/vehicle_screen_controller.dart';
import 'package:ridenepal/models/all_vehicles.dart';
import 'package:ridenepal/utils/apis.dart';
import 'package:ridenepal/views/Specification_Screen.dart';

class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({super.key});

  @override
  _SearchAndFilterState createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {
  final List<String> vehicleTypes = ['Car', 'Motorcycle', 'Scooter', 'Jeep'];
  final List<String> sortOptions = [
    'Sort by Highest Price',
    'Sort by Lowest Price',
    'Sort by Highest Rating',
    'Sort by Lowest Rating',
  ];

  final TextEditingController _searchController = TextEditingController();
  // final VehicleScreenController c = Get.find();
  final c = Get.put(VehicleScreenController());

  String? selectedType;
  int? hoveredSortIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Search and Filter",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.5)),
                    ),
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search by name...",
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.8)),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) => c.filterVehicle(value),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showFilterOptions(context);
                  },
                  icon: const Icon(
                    Icons.filter_alt,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: vehicleTypes.map((type) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: VehicleTypeWidget(
                      type: type,
                      isActive: type == selectedType,
                      onTap: () {
                        setState(() {
                          selectedType = type;
                        });
                        _onVehicleTypeTap(type);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(() {
                final filteredVehicles = c.searchVehicle;
                if (filteredVehicles.isEmpty) {
                  return const SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Image(
                            height: 300,
                            image: AssetImage(
                              "assets/images/noresultfound.jpg",
                            ),
                          ),
                          Text(
                            'No results found!',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredVehicles.length,
                    itemBuilder: (context, index) {
                      AllVehicles vehicles = filteredVehicles[index];
                      return SearchVehicleList(
                        vehicles: vehicles,
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _onVehicleTypeTap(String type) {
    c.filterVehicleByType(type);
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < sortOptions.length; i++)
              _buildSortOption(sortOptions[i], i),
          ],
        );
      },
    );
  }

  Widget _buildSortOption(String option, int index) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredSortIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          hoveredSortIndex = null;
        });
      },
      child: ListTile(
        title: Text(
          option,
          style: TextStyle(
            color: hoveredSortIndex == index ? Colors.green : Colors.black,
          ),
        ),
        onTap: () {
          _onSortOptionTap(option);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _onSortOptionTap(String option) {
    switch (option) {
      case 'Sort by Highest Price':
        Get.find<VehicleScreenController>().sortByHighestPrice();
        break;
      case 'Sort by Lowest Price':
        Get.find<VehicleScreenController>().sortByLowestPrice();
        break;
      case 'Sort by Highest Rating':
        Get.find<VehicleScreenController>().sortByHighestRating();
        break;
      case 'Sort by Lowest Rating':
        Get.find<VehicleScreenController>().sortByLowestRating();
        break;
    }
  }
}

class VehicleTypeWidget extends StatelessWidget {
  final String type;
  final bool isActive;
  final VoidCallback onTap;

  const VehicleTypeWidget({
    required this.type,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  static const Map<String, IconData> typeToIcon = {
    'Car': Icons.directions_car,
    'Motorcycle': Icons.motorcycle,
    'Scooter': Icons.directions_bike,
    'Jeep': Icons.directions_bus_filled_outlined,
  };

  @override
  Widget build(BuildContext context) {
    IconData iconData = typeToIcon[type] ?? Icons.directions_car;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 4),
            Text(
              type,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchVehicleList extends StatelessWidget {
  const SearchVehicleList({super.key, required this.vehicles});

  final AllVehicles vehicles;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SpecificationScreen(
              vehicles: vehicles,
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                "${Api.imageFolderPath}${vehicles.vehicleImage}",
                width: double.infinity,
                height: 128,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          vehicles.vehicleBrand ?? " ",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(vehicles.rating ?? "5"),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Rs ${vehicles.price ?? ""}/day",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 2, 109, 196),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
