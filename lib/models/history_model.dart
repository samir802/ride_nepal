List<OrderDetails> bookingHistoryFromJson(
        List<dynamic> bookingHistoryFromJson) =>
    List<OrderDetails>.from(bookingHistoryFromJson
        .map((bookingJson) => OrderDetails.fromJson(bookingJson)));

class OrderDetails {
  String? rentedDate;
  String? totalPrice;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? vehicleimage;
  String? vehicleBrand;
  String? capacity;
  String? fuelType;
  String? price;

  OrderDetails({
    this.rentedDate,
    this.totalPrice,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.vehicleimage,
    this.vehicleBrand,
    this.capacity,
    this.fuelType,
    this.price,
  });

  OrderDetails.fromJson(Map<String, dynamic> json) {
    rentedDate = json['Rented_date'];
    totalPrice = json['Total_Price'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    vehicleimage = json['Vehicle_Image'];
    vehicleBrand = json['VehicleBrand'];
    capacity = json['Capacity'];
    fuelType = json['FuelType'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['Rented_date'] = rentedDate;
    data['Total_Price'] = totalPrice;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    data['Vehicle_Image'] = vehicleimage;
    data['VehicleBrand'] = vehicleBrand;
    data['Capacity'] = capacity;
    data['FuelType'] = fuelType;
    data['Price'] = price;

    return data;
  }
}
