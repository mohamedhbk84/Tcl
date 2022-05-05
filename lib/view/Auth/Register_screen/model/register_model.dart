
import 'dart:convert';

RegisterModel registerModelFromMap(String str) => RegisterModel.fromMap(json.decode(str));

String registerModelToMap(RegisterModel data) => json.encode(data.toMap());

class RegisterModel {
  RegisterModel({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": data!.toMap(),
  };
}

class Data {
  Data({
    this.name,
    this.position,
    this.company,
    this.email,
    this.personalPhone,
    this.password,
    this.apiToken,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? name;
  String? position;
  String? company;
  String? email;
  String? personalPhone;
  String? password;
  String? apiToken;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    name: json["name"],
    position: json["position"],
    company: json["company"],
    email: json["email"],
    personalPhone: json["personal_phone"],
    password: json["password"],
    apiToken: json["api_token"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "position": position,
    "company": company,
    "email": email,
    "personal_phone": personalPhone,
    "password": password,
    "api_token": apiToken,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}
