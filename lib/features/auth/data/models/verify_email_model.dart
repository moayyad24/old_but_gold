class VerifyEmailModel {
  String status;
  String message;
  Data data;

  VerifyEmailModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) =>
      VerifyEmailModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  String token;

  Data({required this.token});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(token: json["token"]);
}
