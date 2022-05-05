// To parse this JSON data, do
//
//     final technicalAdvicesModel = technicalAdvicesModelFromMap(jsonString);

import 'dart:convert';

TechnicalAdvicesModel technicalAdvicesModelFromMap(String str) => TechnicalAdvicesModel.fromMap(json.decode(str));


class TechnicalAdvicesModel {
  TechnicalAdvicesModel({
    this.advicessActivity,
    this.status,

  });

  AdvicessActivity? advicessActivity;
  String? status;

  factory TechnicalAdvicesModel.fromMap(Map<String, dynamic> json) => TechnicalAdvicesModel(
    advicessActivity: AdvicessActivity.fromMap(json["advicessActivity"]),
    status: json["status"],
  );


}

class AdvicessActivity {
  AdvicessActivity({
    this.currentPage,
    this.data,


  });

  int? currentPage;
  List<TechnicalData>? data;


  factory AdvicessActivity.fromMap(Map<String, dynamic> json) => AdvicessActivity(
    currentPage: json["current_page"],
    data: List<TechnicalData>.from(json["data"].map((x) => TechnicalData.fromMap(x))),

  );

}

class TechnicalData {
  TechnicalData({
    this.id,
    this.name,
    this.advices,

  });

  int? id;
  String? name;
  int? advices;


  factory TechnicalData.fromMap(Map<String, dynamic> json) => TechnicalData(
    id: json["id"],
    name: json["name"],
    advices: json["advices"],

  );


}





