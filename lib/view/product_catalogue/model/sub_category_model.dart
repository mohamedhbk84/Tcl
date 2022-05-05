class Sub_category_model {
  Sub_category_model({
    Data? data,
    String? status,
  }) {
    _data = data;
    _status = status;
  }

  Sub_category_model.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }

  Data? _data;
  String? _status;

  Data? get data => _data;

  String? get status => _status;
}

class Data {
  Data({
    List<DataDetails>? data,
  }) {
    _data = data;
  }

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DataDetails.fromJson(v));
      });
    }
  }

  List<DataDetails>? _data;


  List<DataDetails>? get data => _data;
}

class DataDetails {
  DataDetails({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  DataDetails.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  int? _id;
  String? _name;

  int? get id => _id;

  String? get name => _name;
}
