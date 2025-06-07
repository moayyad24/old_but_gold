class LoginModel {
  String status;
  String message;
  Data data;

  LoginModel({required this.status, required this.message, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  String token;
  String type;

  Data({required this.token, required this.type});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(token: json["token"], type: json["type"]);
}
