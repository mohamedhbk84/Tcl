class SearchEcommerce {
  List<Products>? products;

  SearchEcommerce({this.products});

  SearchEcommerce.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  dynamic? productId;
  dynamic? thumb;
  dynamic? name;
  dynamic? description;
  dynamic? price;
  bool? special;
  dynamic? tax;
  dynamic? minimum;
  int? rating;
  dynamic? href;

  Products(
      {this.productId,
        this.thumb,
        this.name,
        this.description,
        this.price,
        this.special,
        this.tax,
        this.minimum,
        this.rating,
        this.href});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    special = json['special'];
    tax = json['tax'];
    minimum = json['minimum'];
    rating = json['rating'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['special'] = this.special;
    data['tax'] = this.tax;
    data['minimum'] = this.minimum;
    data['rating'] = this.rating;
    data['href'] = this.href;
    return data;
  }
}