import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/core/network/end_points.dart';
import 'package:arab_project/core/network/local/cache_helper.dart';
import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/shared/styles/styles.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/Profile/profile.dart';
import 'package:arab_project/view/advertesments/model/on_boarding_model.dart';
import 'package:arab_project/view/calender/calender.dart';
import 'package:arab_project/view/contact_us/view/contact_us_screen.dart';
import 'package:arab_project/view/layout/home/view/home_screen.dart';
import 'package:arab_project/view/product_catalogue/model/categories_model.dart';
import 'package:arab_project/view/product_catalogue/model/products_model.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/contact_form_screen/view/contact_form_screen.dart';
import 'package:arab_project/view/whatsapp/whatsaap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  // int currentIndex = 0;
  List<Widget> screens = [
    FirstHomeScreen(),
    ContactFormScreen(),
    CalenderScreen(),
    WhatsApp(),

    ContactUsScreen(),
    ProfileScreen(),

  ];
  List<String>? titles = ['Home', 'Inquiry','Calender','WhatsApp','Call us' ,'Profile'  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottonNavBarState());
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    emit(AppGetCategoryLoadingState());
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel!.data!.data![0].name);

      emit(AppGetCategorySuccessState());
    }).catchError((error) {
      print('الايرور هنا وانت بتجيب Category' + error.toString());
      emit(AppGetCategoryErrorState(error.toString()));
    });
  }

  CategoriesModel? subCategoriesModel;

  void getSubCategories(id) {
    if (subCategoriesModel != null) {
      subCategoriesModel!.data!.data!.clear();
    }
    emit(AppGetSubCategoryLoadingState());
    DioHelper.getData(url: SUB_CATEGORIES, qurey: {'category_id': id})
        .then((value) {
      subCategoriesModel = CategoriesModel.fromJson(value.data);

      emit(AppGetSubCategorySuccessState());
    }).catchError((error) {
      print(categoriesModel!.data!.data![2].id);
      print('ERROR SUBCategory' + error.toString());
      emit(AppGetSubCategoryErrorState(error.toString()));
    });
  }


  ProductsModel? productsModel;

  Future<dynamic> getProductsData(id) async {
    emit(AppGetProductLoadingState());
    if (productsModel != null) {
      productsModel!.dataModel!.data!.clear();
    }
    getData(id);

  }

  void getData(id) async {
    await DioHelper.getData(url: PRODUCTS, qurey: {'category_id': id})
        .then((value) {
      productsModel = ProductsModel.fromJson(value.data);
      print(value);

      emit(AppGetProductSuccessState());
    }).catchError((error) {
      print('ERROR In Product' + error.toString());
      emit(AppGetProductErrorState(error.toString()));
    });
  }

  CategoriesModel? homeCatModel;

  void getHomeCategories() {
    emit(AppGetCategoryLoadingState());
    DioHelper.getData(
      url: HOME,
    ).then((value) {
      homeCatModel = CategoriesModel.fromJson(value.data);
      print(value.data);

      emit(AppGetCategorySuccessState());
    }).catchError((error) {
      print('الايرور هنا وانت بتجيب Category' + error.toString());
      emit(AppGetCategoryErrorState(error.toString()));
    });
  }


  String? dropDownValue;

  void changeListInquiry(String? val) {
    dropDownValue = val;
    emit(AppChangeListInquiryState());
  }

  void postInquiryForm({
    required String message,
    required int user_id,
    required String type,
  }) {
    emit(postInquiryLoadingState());
    DioHelper.postData(url: INQUIRY_FORM, data: {
      'message': message,
      'user_id': user_id,
      'type': type,
    }).then((value) {
      showToast(msg: 'Data Added Successfully', state: ToastStates.SUCCESS);
      emit(postInquirySuccessState());
    }).catchError((error) {
      emit(postInquiryErrorState());
    });
  }

  OnBoardingModel? onBoardingModel;

  void getOnBoarding() {
    emit(GetOnBoardingLoadingState());
    DioHelper.getData(url: ON_BOARDING).then((value) {
      onBoardingModel = OnBoardingModel.fromMap(value.data);
      print("000000000000000000");
      print(value.data);
      print("ششششششششش${onBoardingModel!.data!.image!}");
      emit(GetOnBoardingSuccessState());
    }).catchError((error) {
      emit(GetOnBoardingErrorState());
    });
  }
  void getSharedData(){
    CasheHelper.getData(key: "name")==null?  dummyProfile.name= "": dummyProfile.name =CasheHelper.getData(key: "name");
    CasheHelper.getData(key: "id")==null?  dummyProfile.id= 0: dummyProfile.id =CasheHelper.getData(key: "id");
    CasheHelper.getData(key: "phone")==null?  dummyProfile.phone= '': dummyProfile.phone =CasheHelper.getData(key: "phone");
    CasheHelper.getData(key: "password")==null?  dummyProfile.password= '': dummyProfile.password =CasheHelper.getData(key: "password");

    CasheHelper.getData(key: "email")==null? dummyProfile.email = "": dummyProfile.email =CasheHelper.getData(key: "email");
    CasheHelper.getData(key: "position")==null? dummyProfile.position = "": dummyProfile.position =CasheHelper.getData(key: "position");
    CasheHelper.getData(key: "company")==null? dummyProfile.company = "": dummyProfile.company =CasheHelper.getData(key: "company");
  }


}
