List<ProfileDetails> profileDetailsFromJson(
        List<dynamic> profileDetailsFromJson) =>
    List<ProfileDetails>.from(profileDetailsFromJson
        .map((profileJson) => ProfileDetails.fromJson(profileJson)));

class ProfileDetails {
  String? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? password;
  String? image;
  String? type;

  ProfileDetails(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.email,
      this.password,
      this.image,
      this.type});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    image = json['Image'];
    type = json['type'];
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
    data['type'] = type;
    return data;
  }
}
