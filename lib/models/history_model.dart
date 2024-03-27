List<OrderDetails> bookingHistoryFromJson(
        List<dynamic> bookingHistoryFromJson) =>
    List<OrderDetails>.from(bookingHistoryFromJson
        .map((bookingJson) => OrderDetails.fromJson(bookingJson)));

class OrderDetails {
  String? orderId;
  String? rentedDate;
  String? returnDate;
  String? status;
  String? totalPrice;
  String? userId;
  String? vehicleId;
  String? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? password;
  String? image;
  String? type;
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
  String? vehicleType;
  String? companyId;

  OrderDetails(
      {this.orderId,
      this.rentedDate,
      this.returnDate,
      this.status,
      this.totalPrice,
      this.userId,
      this.vehicleId,
      this.id,
      this.name,
      this.phone,
      this.address,
      this.email,
      this.password,
      this.image,
      this.type,
      this.vehicleID,
      this.vehicleInfo,
      this.vehicleBrand,
      this.capacity,
      this.engineCapacity,
      this.fuelConsumption,
      this.drivingMethod,
      this.fuelType,
      this.price,
      this.vehicleImage,
      this.vehicleType,
      this.companyId});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['OrderId'];
    rentedDate = json['Rented_date'];
    returnDate = json['Return_Date'];
    status = json['status'];
    totalPrice = json['Total_Price'];
    userId = json['user_id'];
    vehicleId = json['vehicle_id'];
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    image = json['Image'];
    type = json['type'];
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
    vehicleType = json['Vehicle_type'];
    companyId = json['Company_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OrderId'] = orderId;
    data['Rented_date'] = rentedDate;
    data['Return_Date'] = returnDate;
    data['status'] = status;
    data['Total_Price'] = totalPrice;
    data['user_id'] = userId;
    data['vehicle_id'] = vehicleId;
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    data['password'] = password;
    data['Image'] = image;
    data['type'] = type;
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
    data['Vehicle_type'] = vehicleType;
    data['Company_Id'] = companyId;
    return data;
  }
}
