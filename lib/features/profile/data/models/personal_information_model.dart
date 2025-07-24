class PersonalInformationModel {
  final int? id;
  final String name;
  final String? email;
  final String? gender;
  final DateTime birthday;
  final String phone;
  final String longitude;
  final String latitude;
  final String address;

  PersonalInformationModel({
    this.id,
    required this.name,
    this.email,
    this.gender,
    required this.birthday,
    required this.phone,
    required this.longitude,
    required this.latitude,
    required this.address,
  });

  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) {
    return PersonalInformationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String?,
      birthday: DateTime.parse(json['birthday']),
      phone: json['phone'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      address: json['address'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthday': birthday.toIso8601String(),
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'address': address,
    };
  }
}
