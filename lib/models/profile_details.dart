List<ProfileDetails> profileDetailsFromJson(
        List<dynamic> profileDetailsFromJson) =>
    List<ProfileDetails>.from(profileDetailsFromJson
        .map((bookingJson) => ProfileDetails.fromJson(bookingJson)));

class ProfileDetails {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? password;
  String? image;

  ProfileDetails(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.email,
      this.password,
      this.image});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    data['password'] = password;
    data['Image'] = image;
    return data;
  }
}
