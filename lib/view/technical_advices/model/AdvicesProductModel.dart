// To parse this JSON data, do
//
//     final productsAdvicesModel = productsAdvicesModelFromMap(jsonString);

import 'dart:convert';

import 'package:arab_project/shared/functions/remove_tags.dart';
import 'package:arab_project/view/advertesments/model/on_boarding_model.dart';

ProductsAdvicesModel productsAdvicesModelFromMap(String str) => ProductsAdvicesModel.fromMap(json.decode(str));

String productsAdvicesModelToMap(ProductsAdvicesModel data) => json.encode(data.toJson());

class ProductsAdvicesModel {
  ProductsAdvicesModel({
    this.adviceDetails,
    this.data,
    this.status,
  });

  AdviceDetails? adviceDetails;
 // List<Datum>? data;
  List<Data> ?data;
  String? status;

   ProductsAdvicesModel.fromMap(Map<String, dynamic> json) {
    adviceDetails = json['advice_details'] != null
        ?  AdviceDetails.fromMap(json['advice_details'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    status = json['status'];
  }
  //     ProductsAdvicesModel(
  //   adviceDetails: AdviceDetails.fromMap(json["advice_details"]),
  //   data:[],
  //   //List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  //   status: json["status"],
  // );

//   Map<String, dynamic> toMap() => {
//     "advice_details": adviceDetails!.toMap(),
//     "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//     "status": status,
//   };
// }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adviceDetails != null) {
      data['advice_details'] = this.adviceDetails!.toMap();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class AdviceDetails {
  AdviceDetails({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.recordStatus,
    this.deleteStatus,
    this.dateAdded,
    this.dateModified,
    this.addedBy,
    this.modifiedBy,
    this.imageLink,
    this.shortDesc,
    this.paragraph1,
    this.paragraph2,
    this.document,
    this.video,
    this.advices,
    this.productCategoryId,
  });

  int? id;
  String? title;
  String? description;
  dynamic createdAt;
  dynamic updatedAt;
  int? isActive;
  int? recordStatus;
  int? deleteStatus;
  DateTime? dateAdded;
  DateTime? dateModified;
  int? addedBy;
  int? modifiedBy;
  String? imageLink;
  String? shortDesc;
  String? paragraph1;
  String? paragraph2;
  String? document;
  String? video;
  int? advices;
  int? productCategoryId;

  factory AdviceDetails.fromMap(Map<String, dynamic> json) => AdviceDetails(
    id: json["id"],
    title: json["title"] == null ? "":json["title"],
    description: json["description"]== null ? "":json["description"],
    createdAt: json["created_at"]== null ? "":json["created_at"],
    updatedAt: json["updated_at"]== null ? "":json["updated_at"],
    isActive: json["isActive"],
    recordStatus: json["record_status"]== null ? 0:json["record_status"],
    deleteStatus: json["delete_status"]== null ?0:json["delete_status"],
    dateAdded:json["date_added"]==null ?DateTime(2022,): DateTime.parse(json["date_added"]),
    dateModified:json["date_modified"]==null ?DateTime(2022,): DateTime.parse(json["date_modified"]),
    addedBy: json["added_by"]== null ? 0:json["added_by"],
    modifiedBy: json["modified_by"]== null ? 0:json["modified_by"],
    imageLink: json["image_link"]== null ? "":json["image_link"],
    shortDesc: json["short_desc"]== null ? "":json["short_desc"],
    paragraph1: json["paragraph1"]== null ? "":json["paragraph1"],
    paragraph2: json["paragraph2"]== null ? "":json["paragraph2"],
    document: json["document"]== null ? "":json["document"],
    video: json["video"]== null ? "":json["video"],
    advices: json["advices"]== null ? 0:json["advices"],
    productCategoryId: json["product_category_id"]== null ? 0:json["product_category_id"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "isActive": isActive,
    "record_status": recordStatus,
    "delete_status": deleteStatus,
    "date_added": dateAdded!.toIso8601String(),
    "date_modified": dateModified!.toIso8601String(),
    "added_by": addedBy,
    "modified_by": modifiedBy,
    "image_link": imageLink,
    "short_desc": shortDesc,
    "paragraph1": paragraph1,
    "paragraph2": paragraph2,
    "document": document,
    "video": video,
    "advices": advices,
    "product_category_id": productCategoryId,
  };
}

// class Datum {
//   Datum({
//     this.id,
//     this.productId,
//     this.productCategoryId,
//     this.recordStatus,
//     this.deleteStatus,
//     this.dateAdded,
//     this.dateModified,
//     this.addedBy,
//     this.modifiedBy,
//     this.advicesId,
//     this.products,
//   });
//
//   int? id;
//   int? productId;
//   dynamic productCategoryId;
//   int? recordStatus;
//   int? deleteStatus;
//   DateTime? dateAdded;
//   DateTime? dateModified;
//   int? addedBy;
//   int? modifiedBy;
//   int? advicesId;
//   Products? products;
//
//   factory Datum.fromMap(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     productId: json["product_id"],
//     productCategoryId: json["product_category_id"],
//     recordStatus: json["record_status"],
//     deleteStatus: json["delete_status"],
//     dateAdded: DateTime.parse(json["date_added"]),
//     dateModified: DateTime.parse(json["date_modified"]),
//     addedBy: json["added_by"],
//     modifiedBy: json["modified_by"],
//     advicesId: json["advices_id"],
//     products: json["products"] == null ? null : Products.fromMap(json["products"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "product_id": productId,
//     "product_category_id": productCategoryId,
//     "record_status": recordStatus,
//     "delete_status": deleteStatus,
//     "date_added": dateAdded!.toIso8601String(),
//     "date_modified": dateModified!.toIso8601String(),
//     "added_by": addedBy,
//     "modified_by": modifiedBy,
//     "advices_id": advicesId,
//     "products": products == null ? null : products!.toMap(),
//   };
// }
//
// class Products {
//   Products({
//     this.id,
//     this.name,
//     this.photoLink,
//   });
//
//   int? id;
//   String? name;
//   String? photoLink;
//
//   factory Products.fromMap(Map<String, dynamic> json) => Products(
//     id: json["id"],
//     name: json["name"],
//     photoLink: json["photo_link"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "name": name,
//     "photo_link": photoLink == null ? "" : photoLink,
//   };
// }
class Data {
  int? id;
  int? productId;
  Null? productCategoryId;
  int? recordStatus;
  int? deleteStatus;
  Null? dateAdded;
  Null? dateModified;
  Null? addedBy;
  Null? modifiedBy;
  int? advicesId;
  Products? products;

  Data(
      {this.id,
        this.productId,
        this.productCategoryId,
        this.recordStatus,
        this.deleteStatus,
        this.dateAdded,
        this.dateModified,
        this.addedBy,
        this.modifiedBy,
        this.advicesId,
        this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productCategoryId = json['product_category_id'];
    recordStatus = json['record_status'];
    deleteStatus = json['delete_status'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    addedBy = json['added_by'];
    modifiedBy = json['modified_by'];
    advicesId = json['advices_id'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_category_id'] = this.productCategoryId;
    data['record_status'] = this.recordStatus;
    data['delete_status'] = this.deleteStatus;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['added_by'] = this.addedBy;
    data['modified_by'] = this.modifiedBy;
    data['advices_id'] = this.advicesId;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? photoLink;

  Products({this.id, this.name, this.photoLink});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photoLink = json['photo_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo_link'] = this.photoLink;
    return data;
  }
}