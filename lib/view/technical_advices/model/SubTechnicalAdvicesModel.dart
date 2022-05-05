/// advicessMaterial : {"current_page":1,"data":[{"id":4,"name":"Room Care Products ","tag":null,"color_code":"#BBA64D","image_link":"room_care.png","header_image":"room-care.jpg","parent_id":4,"record_status":1,"delete_status":0,"date_added":null,"date_modified":"2017-10-16 05:29:27","added_by":null,"modified_by":106,"flag":0},{"id":13,"name":"Floor Care Products","tag":null,"color_code":"#BBA64D","image_link":"floor_care.png","header_image":null,"parent_id":4,"record_status":1,"delete_status":0,"date_added":null,"date_modified":"2017-10-16 05:28:54","added_by":null,"modified_by":106,"flag":0},{"id":20,"name":"Housekeeping General Cleaning Products ","tag":null,"color_code":null,"image_link":"c81c45b6ed61f1585f3371958c3884a2.jpg","header_image":null,"parent_id":4,"record_status":1,"delete_status":1,"date_added":null,"date_modified":null,"added_by":null,"modified_by":null,"flag":0},{"id":23,"name":"Concentrated Housekeeping Chemicals & Dosing System","tag":null,"color_code":null,"image_link":"99e1b8060aed67a6dc8d38ce15061ec5.jpg","header_image":null,"parent_id":4,"record_status":1,"delete_status":1,"date_added":null,"date_modified":null,"added_by":null,"modified_by":null,"flag":0},{"id":31,"name":"Aroma Diffuser","tag":null,"color_code":"#BBA64D","image_link":"air_freshener_solution.png","header_image":null,"parent_id":4,"record_status":1,"delete_status":0,"date_added":null,"date_modified":"2017-10-16 05:30:55","added_by":null,"modified_by":106,"flag":0},{"id":37,"name":"Smart Housekeeping Chemicals","tag":null,"color_code":"#BBA64D","image_link":"smart1.png","header_image":null,"parent_id":4,"record_status":1,"delete_status":1,"date_added":"2017-10-16 06:49:41","date_modified":"2017-10-16 06:59:17","added_by":106,"modified_by":106,"flag":0},{"id":39,"name":"Free of Charge Items","tag":null,"color_code":null,"image_link":null,"header_image":null,"parent_id":4,"record_status":1,"delete_status":1,"date_added":"2017-11-08 01:48:35","date_modified":"2017-11-08 01:48:35","added_by":9,"modified_by":9,"flag":0}],"first_page_url":"https://appadmin.tclgcc.com/api/advices/subcategory?page=1","from":1,"last_page":1,"last_page_url":"https://appadmin.tclgcc.com/api/advices/subcategory?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://appadmin.tclgcc.com/api/advices/subcategory?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"https://appadmin.tclgcc.com/api/advices/subcategory","per_page":10,"prev_page_url":null,"to":7,"total":7}
/// status : "success"

class SubTechnicalAdvicesModel {
  SubTechnicalAdvicesModel({
      AdvicessMaterial? advicessMaterial, 
      String? status,}){
    _advicessMaterial = advicessMaterial;
    _status = status;
}

  SubTechnicalAdvicesModel.fromJson(dynamic json) {
    _advicessMaterial = json['advicessMaterial'] != null ? AdvicessMaterial.fromJson(json['advicessMaterial']) : null;
    _status = json['status'];
  }
  AdvicessMaterial? _advicessMaterial;
  String? _status;

  AdvicessMaterial? get advicessMaterial => _advicessMaterial;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_advicessMaterial != null) {
      map['advicessMaterial'] = _advicessMaterial?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// current_page : 1
/// data : [{"id":4,"name":"Room Care Products ","tag":null,"color_code":"#BBA64D","image_link":"room_care.png","header_image":"room-care.jpg","parent_id":4,"record_status":1,"delete_status":0,"date_added":null,"date_modified":"2017-10-16 05:29:27","added_by":null,"modified_by":106,"flag":0},{"id":13,"name":"Floor Care Products","tag":null,"color_code":"#BBA64D","image_link":"floor_care.png","header_image":null,"parent_id":4,"record_status":1,"delete_status":0,"date_added":null,"date_modified":"2017-10-16 05:28:54","added_by":null,"modified_by":106,"flag":0},{"id":20,"name":"Housekeeping General Cleaning Products ","tag":null,"color_code":null,"image_link":"c81c45b6ed61f1585f3371958c3884a2.jpg","header_image":null,"parent_id":4,"record_status":1,"delete_status":1,"date_added":null,"date_modified":null,"added_by":null,"modified_by":null,"flag":0},{"id":23,"name":"Concentrated Housekeeping Chemicals & Dosing System","tag":null,"color_code":null,"image_link":"99e1b8060aed67a6dc8d38ce15061ec5.jpg","header_image":null,"parent_id":4,"record_status":1,"delete_status":1,"date_added":null,"date_modified":null,"added_by":null,"modified_by":null,"flag":0},{"id":31,"name":"Aroma Diffuser","tag":null,"color_code":"#BBA64D","image_link":"air_freshener_solution.png","header_image":null,"parent_id":4,"record_status":1,"delete_status":0,"date_added":null,"date_modified":"2017-10-16 05:30:55","added_by":null,"modified_by":106,"flag":0},{"id":37,"name":"Smart Housekeeping Chemicals","tag":null,"color_code":"#BBA64D","image_link":"smart1.png","header_image":null,"parent_id":4,"record_status":1,"delete_status":1,"date_added":"2017-10-16 06:49:41","date_modified":"2017-10-16 06:59:17","added_by":106,"modified_by":106,"flag":0},{"id":39,"name":"Free of Charge Items","tag":null,"color_code":null,"image_link":null,"header_image":null,"parent_id":4,"record_status":1,"delete_status":1,"date_added":"2017-11-08 01:48:35","date_modified":"2017-11-08 01:48:35","added_by":9,"modified_by":9,"flag":0}]
/// first_page_url : "https://appadmin.tclgcc.com/api/advices/subcategory?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://appadmin.tclgcc.com/api/advices/subcategory?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://appadmin.tclgcc.com/api/advices/subcategory?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "https://appadmin.tclgcc.com/api/advices/subcategory"
/// per_page : 10
/// prev_page_url : null
/// to : 7
/// total : 7

class AdvicessMaterial {
  AdvicessMaterial({
      int? currentPage, 
      List<SubData>? data,
      String? firstPageUrl, 
      int? from, 
      int? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      dynamic nextPageUrl, 
      String? path, 
      int? perPage, 
      dynamic prevPageUrl, 
      int? to, 
      int? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  AdvicessMaterial.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SubData.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  int? _currentPage;
  List<SubData>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  dynamic _nextPageUrl;
  String? _path;
  int? _perPage;
  dynamic _prevPageUrl;
  int? _to;
  int? _total;

  int? get currentPage => _currentPage;
  List<SubData>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  int? get from => _from;
  int? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  int? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  int? get to => _to;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// url : null
/// label : "&laquo; Previous"
/// active : false

class Links {
  Links({
      dynamic url, 
      String? label, 
      bool? active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;

  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }

}

/// id : 4
/// name : "Room Care Products "
/// tag : null
/// color_code : "#BBA64D"
/// image_link : "room_care.png"
/// header_image : "room-care.jpg"
/// parent_id : 4
/// record_status : 1
/// delete_status : 0
/// date_added : null
/// date_modified : "2017-10-16 05:29:27"
/// added_by : null
/// modified_by : 106
/// flag : 0

class SubData {
  SubData({
      int? id, 
      String? name, 
      dynamic tag, 
      String? colorCode, 
      String? imageLink, 
      String? headerImage, 
      int? parentId, 
      int? recordStatus, 
      int? deleteStatus, 
      dynamic dateAdded, 
      String? dateModified, 
      dynamic addedBy, 
      int? modifiedBy, 
      int? flag,}){
    _id = id;
    _name = name;
    _advices = advices;

}

  SubData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _advices = json['advices'];

  }
  int? _id;
  String? _name;
  int? _advices;

  int? get id => _id;
  String? get name => _name;
  int? get advices => _advices;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['advices'] = _advices;

    return map;
  }

}