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
      id: json['id'],
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] ?? '',
      birthday: DateTime.parse(json['birthday'] ?? '2023-12-25T10:30:45.500Z'),
      phone: (json['phone'] as int).toString(),
      longitude: (json['longitude'] as int).toString(),
      latitude: (json['latitude'] as int).toString(),
      address: json['address'] ?? '',
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
