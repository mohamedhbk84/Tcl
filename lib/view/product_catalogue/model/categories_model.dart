class CategoriesModel
{
  CategoriesDataModel? data;

  CategoriesModel.fromJson(Map<String, dynamic> json)
  {
    data = CategoriesDataModel.fromJson(json['data']??0);
  }
}

class CategoriesDataModel
{
  int? currentPage;
  List<DataModel>? data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic>? json)
  {
    currentPage = json!['current_page']??0;
    json['data'].forEach((element)
    {
      data!.add(DataModel.fromJson(element));
    });
  }
}

class DataModel
{
  int? id;
  String? name;

  DataModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id']??0;
    name = json['name']??'';
  }
}