import 'package:arab_project/shared/functions/remove_tags.dart';

class ProductsModel {
  String? status;
  ProductDataModel? dataModel;

  ProductsModel.fromJson(Map<String, dynamic>? json) {
    dataModel = ProductDataModel.fromJson(json!['data']);
  }
}
class ProductDataModel {
  int? currentPage;
  List<ProductDetails>? data = [];

  ProductDataModel.fromJson(Map<String, dynamic>? json) {
    currentPage = json!['current_page'];
    json['data'].forEach((element) {
      data!.add(ProductDetails.fromJson(element));
    });
  }
}

class ProductDetails {
  int? id;
  int? categoryId;
  String? name;
  String? shortDesc;
  String? longDesc;
  String? photoLink;
  String? youtubeId;
  String? howToUse;
  String? slug;
  String? whereToUse;
  String? avaliablePacking;
  String? msds;

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    categoryId = json['category_id']??'';
    name = json['name']??'';
    slug = json['slug'];
    shortDesc = removeAllHtmlTags(json['short_desc']??'');
    longDesc = removeAllHtmlTags(json['long_desc']??'');
    if (json['photo_link'] != ""||json['photo_link'] != null) {
      photoLink = removeAllHtmlTags(json['photo_link']);
    }
    youtubeId = json['youtube_id']??'';
    howToUse = removeAllHtmlTags(json['how_to_use']??'');

    whereToUse = removeAllHtmlTags(json['where_to_use']??'');
    avaliablePacking = removeAllHtmlTags(json['avaliable_packing']??'');

    msds = json['msds']??'';
  }
}

