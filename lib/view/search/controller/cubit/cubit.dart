import 'package:arab_project/core/network/end_points.dart';
import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/view/product_catalogue/model/products_model.dart';
import 'package:arab_project/view/search/controller/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<ShopSearchStates> {
  SearchCubit() : super(ShopSearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  ProductsModel? searchModel;

  void getSearchData({
    required String? text,
  }) {
    emit(ShopSearchLoadingState());
    DioHelper.getData(
        url: SEARCH,
        qurey: {'keyword' :text}).then((value) {
      searchModel = ProductsModel.fromJson(value.data);
      emit(ShopSearchSuccessState());
      print(value.data);
    }).catchError((error) {
      emit(ShopSearchErrorState(error.toString()));
      print(error.toString());
    });
  }


}