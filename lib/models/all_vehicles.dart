List<AllVehicles> allVehiclesFromJson(List<dynamic> allVehiclesFromJson) =>
    List<AllVehicles>.from(allVehiclesFromJson
        .map((vehiclesJson) => AllVehicles.fromJson(vehiclesJson)));

class AllVehicles {
  String? vehicleID;
  String? vehicleBrand;
  String? capacity;
  String? engineCapacity;
  String? fuelConsumption;
  String? drivingMethod;
  String? fuelType;
  String? price;
  String? vehicleImage;
  String? companyName;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? image;

  AllVehicles(
      {this.vehicleID,
      this.vehicleBrand,
      this.capacity,
      this.engineCapacity,
      this.fuelConsumption,
      this.drivingMethod,
      this.fuelType,
      this.price,
      this.vehicleImage,
      this.companyName,
      this.name,
      this.phone,
      this.address,
      this.email,
      this.image});

  AllVehicles.fromJson(Map<String, dynamic> json) {
    vehicleID = json['VehicleID'];
    vehicleBrand = json['VehicleBrand'];
    capacity = json['Capacity'];
    engineCapacity = json['Engine_capacity'];
    fuelConsumption = json['Fuel_consumption'];
    drivingMethod = json['Driving_method'];
    fuelType = json['FuelType'];
    price = json['Price'];
    vehicleImage = json['Vehicle_Image'];
    companyName = json['Company_Name'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VehicleID'] = vehicleID;
    data['VehicleBrand'] = vehicleBrand;
    data['Capacity'] = capacity;
    data['Engine_capacity'] = engineCapacity;
    data['Fuel_consumption'] = fuelConsumption;
    data['Driving_method'] = drivingMethod;
    data['FuelType'] = fuelType;
    data['Price'] = price;
    data['Vehicle_Image'] = vehicleImage;
    data['Company_Name'] = companyName;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    data['Image'] = image;
    return data;
  }
}
