List<AllVehicles> allVehiclesFromJson(List<dynamic> allVehiclesFromJson) =>
    List<AllVehicles>.from(allVehiclesFromJson
        .map((vehiclesJson) => AllVehicles.fromJson(vehiclesJson)));

class AllVehicles {
  String? vehicleID;
  String? vehicleBrand;
  String? capacity;
  String? fuelType;

  AllVehicles(
      {this.vehicleID, this.vehicleBrand, this.capacity, this.fuelType});

  AllVehicles.fromJson(Map<String, dynamic> json) {
    vehicleID = json['VehicleID'];
    vehicleBrand = json['VehicleBrand'];
    capacity = json['Capacity'];
    fuelType = json['FuelType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VehicleID'] = vehicleID;
    data['VehicleBrand'] = vehicleBrand;
    data['Capacity'] = capacity;
    data['FuelType'] = fuelType;
    return data;
  }
}
