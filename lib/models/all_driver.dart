List<AllDriver> driverFromJson(List<dynamic> driverFromJson) =>
    List<AllDriver>.from(
        driverFromJson.map((driverJson) => AllDriver.fromJson(driverJson)));

class AllDriver {
  String? driverID;
  String? driverName;
  String? phone;
  String? address;
  String? price;
  String? vehicleType;

  AllDriver(
      {this.driverID,
      this.driverName,
      this.phone,
      this.address,
      this.price,
      this.vehicleType});

  AllDriver.fromJson(Map<String, dynamic> json) {
    driverID = json['Driver_ID'];
    driverName = json['Driver_Name'];
    phone = json['Phone'];
    address = json['Address'];
    price = json['Price'];
    vehicleType = json['Vehicle_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Driver_ID'] = driverID;
    data['Driver_Name'] = driverName;
    data['Phone'] = phone;
    data['Address'] = address;
    data['Price'] = price;
    data['Vehicle_type'] = vehicleType;
    return data;
  }
}
