List<AllVehicles> allVehiclesFromJson(List<dynamic> allVehiclesFromJson) =>
    List<AllVehicles>.from(allVehiclesFromJson
        .map((vehiclesJson) => AllVehicles.fromJson(vehiclesJson)));

class AllVehicles {
  String? vehicleID;
  String? vehicleInfo;
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
  String? rating;

  AllVehicles(
      {this.vehicleID,
      this.vehicleInfo,
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
      this.image,
      this.rating});

  AllVehicles.fromJson(Map<String, dynamic> json) {
    vehicleID = json['VehicleID'];
    vehicleInfo = json['Vehicle_Info'];
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
    rating = json['Rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VehicleID'] = vehicleID;
    data['Vehicle_Info'] = vehicleInfo;
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
    data['Rating'] = rating;
    return data;
  }
}
