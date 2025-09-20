class CategoriesModel {
  String status;
  String message;
  List<Data> data;

  CategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json["status"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  int id;
  Name name;
  String? photo;
  List<SubCategory> subCategories;

  Data({
    required this.id,
    required this.name,
    required this.photo,
    required this.subCategories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: Name.fromJson(json["name"]),
    photo: json["photo"] ?? '',
    subCategories: List<SubCategory>.from(
      json["subCategories"].map((x) => SubCategory.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name.toJson(),
    "photo": photo,
    "subCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
  };
}

class Name {
  String en;
  String ar;

  Name({required this.en, required this.ar});

  factory Name.fromJson(Map<String, dynamic> json) =>
      Name(en: json["en"], ar: json["ar"]);

  Map<String, dynamic> toJson() => {"en": en, "ar": ar};
}

class SubCategory {
  int id;
  int categoryId;
  Name name;

  SubCategory({required this.id, required this.categoryId, required this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    categoryId: json["category_id"],
    name: Name.fromJson(json["name"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name.toJson(),
  };
}
