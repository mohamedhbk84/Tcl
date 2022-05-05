// To parse this JSON data, do
//
//     final advicesDetailsModel = advicesDetailsModelFromMap(jsonString);

import 'dart:convert';

AdvicesDetailsModel advicesDetailsModelFromMap(String str) => AdvicesDetailsModel.fromMap(json.decode(str));

String advicesDetailsModelToMap(AdvicesDetailsModel data) => json.encode(data.toMap());

class AdvicesDetailsModel {
  AdvicesDetailsModel({
    this.product,
    this.safty,
    this.longDesc,
    this.howToUse,
    this.status,
  });

  Product? product;
  String? safty;
  String? longDesc;
  String? howToUse;
  String? status;

  factory AdvicesDetailsModel.fromMap(Map<String, dynamic> json) => AdvicesDetailsModel(
    product: Product.fromMap(json["product"]),
    safty: json["safty"],
    longDesc: json["long_desc"],
    howToUse: json["how_to_use"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "product": product!.toMap(),
    "safty": safty,
    "long_desc": longDesc,
    "how_to_use": howToUse,
    "status": status,
  };
}

class Product {
  Product({
    this.id,
    this.categoryId,
    this.siteId,
    this.name,
    this.shortDesc,
    this.longDesc,
    this.photoLink,
    this.youtubeId,
    this.status,
    this.parentId,
    this.slug,
    this.tag,
    this.safty,
    this.howToUse,
    this.whereToUse,
    this.avaliablePacking,
    this.recordStatus,
    this.deleteStatus,
    this.dateAdded,
    this.dateModified,
    this.addedBy,
    this.modifiedBy,
    this.liter,
    this.meter,
    this.file,
    this.msds,
  });

  int? id;
  int? categoryId;
  String? siteId;
  String? name;
  String? shortDesc;
  String? longDesc;
  String? photoLink;
  String? youtubeId;
  int? status;
  int? parentId;
  String? slug;
  String? tag;
  String? safty;
  String? howToUse;
  String? whereToUse;
  String? avaliablePacking;
  int? recordStatus;
  int? deleteStatus;
  dynamic dateAdded;
  DateTime? dateModified;
  dynamic addedBy;
  int? modifiedBy;
  dynamic liter;
  dynamic meter;
  dynamic file;
  String? msds;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    categoryId: json["category_id"],
    siteId: json["site_id"],
    name: json["name"],
    shortDesc: json["short_desc"],
    longDesc: json["long_desc"],
    photoLink: json["photo_link"],
    youtubeId: json["youtube_id"],
    status: json["status"],
    parentId: json["parent_id"],
    slug: json["slug"],
    tag: json["tag"],
    safty: json["safty"],
    howToUse: json["how_to_use"],
    whereToUse: json["where_to_use"],
    avaliablePacking: json["avaliable_packing"],
    recordStatus: json["record_status"],
    deleteStatus: json["delete_status"],
    dateAdded: json["date_added"],
    dateModified: DateTime.parse(json["date_modified"]),
    addedBy: json["added_by"],
    modifiedBy: json["modified_by"],
    liter: json["liter"],
    meter: json["meter"],
    file: json["file"],
    msds: json["msds"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "category_id": categoryId,
    "site_id": siteId,
    "name": name,
    "short_desc": shortDesc,
    "long_desc": longDesc,
    "photo_link": photoLink,
    "youtube_id": youtubeId,
    "status": status,
    "parent_id": parentId,
    "slug": slug,
    "tag": tag,
    "safty": safty,
    "how_to_use": howToUse,
    "where_to_use": whereToUse,
    "avaliable_packing": avaliablePacking,
    "record_status": recordStatus,
    "delete_status": deleteStatus,
    "date_added": dateAdded,
    "date_modified": dateModified!.toIso8601String(),
    "added_by": addedBy,
    "modified_by": modifiedBy,
    "liter": liter,
    "meter": meter,
    "file": file,
    "msds": msds,
  };
}
