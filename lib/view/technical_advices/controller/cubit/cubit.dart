import 'package:arab_project/core/network/end_points.dart';
import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/view/product_catalogue/model/search_ecoomerce.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/states.dart';
import 'package:arab_project/view/technical_advices/model/AdvicesProductModel.dart';
import 'package:arab_project/view/technical_advices/model/SubTechnicalAdvicesModel.dart';
import 'package:arab_project/view/technical_advices/model/TechnicalAdvicesModel.dart';
import 'package:arab_project/view/technical_advices/model/advices_details_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvicesCubit extends Cubit<AdvicesStates> {
  AdvicesCubit() : super(AdvicesInitialStates());

  static AdvicesCubit get(context) => BlocProvider.of(context);

  SubTechnicalAdvicesModel? subTechnicalAdvicesModel;
  List<SubData>? subAdvices;
  List<SubData>? subPromotion;

  void getSubTechnicalAdvicesCategories(id) {
    if (subTechnicalAdvicesModel != null) {
      subTechnicalAdvicesModel!.advicessMaterial!.data!.clear();
    }
    emit(AdvicesGetSubTechnicalAdvicesLoadingState());
    DioHelper.getData(url: SUB_TECHNICAL_ADVICES, qurey: {'category_id': id})
        .then((value) {
      subTechnicalAdvicesModel = SubTechnicalAdvicesModel.fromJson(value.data);
      subTechnicalAdvicesModel!.advicessMaterial!.data!.forEach((element) {
        if (element.advices == 0) {
          subAdvices!.add(element);
        } else {
          subPromotion!.add(element);
        }
      });
      emit(AdvicesGetSubTechnicalAdvicesSuccessState());
    }).catchError((error) {
      emit(AdvicesGetSubTechnicalAdvicesErrorState(error.toString()));
    });
  }

  TechnicalAdvicesModel? techncalAdvices;
  List<TechnicalData>? advices = [];
  List<TechnicalData>? promotion = [];

  void getTechnicalAdvicesCategories() {
    emit(AdvicesGetTechnicalAdvicesLoadingState());
    DioHelper.getData(
      url: TECHNICAL_ADVICES,
    ).then((value) {
      techncalAdvices = TechnicalAdvicesModel.fromMap(value.data);
      techncalAdvices!.advicessActivity!.data!.forEach((element) {
        if (element.advices == 0) {
          advices!.add(element);
        } else {
          promotion!.add(element);
        }
      });

      emit(AdvicesGetTechnicalAdvicesSuccessState());
    }).catchError((error) {
      print(error);
      emit(AdvicesGetTechnicalAdvicesErrorState(error.toString()));
    });
  }

  ProductsAdvicesModel? productsAdvicesModel;

  void getAdvicesPromotionProductData(id) async {
    if (productsAdvicesModel != null) {
      productsAdvicesModel == null;
    }
    print("loadinggggg -------------------");
    emit(AdvicesGetProductsLoadingState());
    await DioHelper.getData(url: ADVICES_PRODUCTS, qurey: {'category_id': id})
        .then((value) {
      productsAdvicesModel = ProductsAdvicesModel.fromMap(value.data);
      print("mohhhhhhhhhhhhhhhhhhamed -------------------");
      print(value.data);
      emit(AdvicesGetProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
      print("Errrrrrrrrrrrrrrrrrrrrrrrrror -------------------");
      emit(AdvicesGetProductsErrorState(error.toString()));
    });
  }
  AdvicesDetailsModel? advicesDetailsModel;
  Future<void> getAdvicesProductsDetails(id)async{
    emit(AdvicesGetDetailsLoadingState());
    await DioHelper.getData(url: ADVICES_DETAILS, qurey: {
      'id':id
    }).then((value) {
      advicesDetailsModel=AdvicesDetailsModel.fromMap(value.data);
      print(advicesDetailsModel);
      emit(AdvicesGetDetailsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AdvicesGetDetailsErrorState());
    });
  }
  SearchEcommerce ? searchEcommerce;
  int productid =81;
  Future <void> getEcommerceData()async{
    emit(AdvicesGetDetailsLoadingState());
    await Dio().get('https://store.tclgcc.com/index.php?route=api/product').then((value) {
      searchEcommerce= SearchEcommerce.fromJson(value.data);
      print("----------------------------");
      print(searchEcommerce!.products![0].name);
      print(advicesDetailsModel!.product!.name);
      for (int i =0 ; i<  searchEcommerce!.products!.length; i++){
        if( searchEcommerce!.products![i].name ==advicesDetailsModel!.product!.name ){
        productid =searchEcommerce!.products![i].productId;
          print("product Name ----");
        }
      }
      emit(AdvicesGetDetailsSuccessState());
    }).catchError((onError){
      print("----nnnnnnnnnn---------");
      print(onError.toString());
      emit(AdvicesGetDetailsErrorState());
    });
  }
}
