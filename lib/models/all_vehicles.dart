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
  String? vehicleType;
  String? price;
  String? vehicleImage;
  String? companyId;
  String? companyName;
  String? companyLogo;
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
      this.vehicleType,
      this.price,
      this.vehicleImage,
      this.companyId,
      this.companyName,
      this.companyLogo,
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
    vehicleType = json['Vehicle_Type'];
    price = json['Price'];
    vehicleImage = json['Vehicle_Image'];
    companyId = json['Company_Id'];
    companyName = json['Company_Name'];
    companyLogo = json['Company_Logo'];
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
    data['Vehicle_Type'] = vehicleType;
    data['Price'] = price;
    data['Vehicle_Image'] = vehicleImage;
    data['Company_Id'] = companyId;
    data['Company_Name'] = companyName;
    data['Company_Logo'] = companyLogo;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    data['Image'] = image;
    data['Rating'] = rating;
    return data;
  }
}
