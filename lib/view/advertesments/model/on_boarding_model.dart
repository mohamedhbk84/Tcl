// To parse this JSON data, do
//
//     final onBoardingModel = onBoardingModelFromMap(jsonString);

import 'dart:convert';

OnBoardingModel onBoardingModelFromMap(String str) => OnBoardingModel.fromMap(json.decode(str));

String onBoardingModelToMap(OnBoardingModel data) => json.encode(data.toMap());

class OnBoardingModel {
  OnBoardingModel({
    this.data,
    this.status,
  });

  Data? data;
  String? status;

  factory OnBoardingModel.fromMap(Map<String, dynamic> json) => OnBoardingModel(
    data: Data.fromMap(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "data": data!.toMap(),
    "status": status,
  };
}

class Data {
  Data({
    this.id,
    this.image,
    this.createdAt,
    this.recordStatus,
    this.deleteStatus,
  });

  int? id;
  String? image;
  DateTime? createdAt;
  int? recordStatus;
  int? deleteStatus;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    image:'http://crm.tclgcc.com/crm/uploads/offers/'+json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    recordStatus: json["record_status"],
    deleteStatus: json["delete_status"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "created_at": createdAt!.toIso8601String(),
    "record_status": recordStatus,
    "delete_status": deleteStatus,
  };
}
