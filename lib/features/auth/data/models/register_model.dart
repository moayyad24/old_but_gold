class RegisterModel {
  String status;
  String message;
  Data data;

  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  String email;
  Data({required this.email});
  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(email: json["email"]);
}
