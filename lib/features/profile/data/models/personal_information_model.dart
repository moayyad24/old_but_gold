class PersonalInformationModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String? email;
  final DateTime birthday;
  final String phone;
  final String longitude;
  final String latitude;
  final String address;
  final String? photoUrl;

  PersonalInformationModel({
    this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    required this.birthday,
    required this.phone,
    required this.longitude,
    required this.latitude,
    required this.address,
    this.photoUrl,
  });

  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) {
    return PersonalInformationModel(
      id: json['id'],
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String? ?? '',
      birthday: DateTime.parse(json['birthday'] ?? '2023-12-25T10:30:45.500Z'),
      phone: (json['phone']).toString(),
      longitude: (json['longitude']).toString(),
      latitude: (json['latitude']).toString(),
      address: json['address'] ?? '',
      photoUrl: json['photo_url'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': '$firstName $lastName',
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'address': address,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'address': address,
      'photo_url': photoUrl,
    };
  }
}
