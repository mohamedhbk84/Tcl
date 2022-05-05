import 'package:arab_project/core/network/end_points.dart';
import 'package:arab_project/core/network/local/cache_helper.dart';
import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/Auth/login/controller/cubit/states.dart';
import 'package:arab_project/view/Auth/login/model/login_model.dart';
import 'package:arab_project/view/layout/app_home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  void userLogin({
    required String? email,
    required String? password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {'email': '$email', 'password': '$password'}).then((value) {
      loginModel = LoginModel.fromMap(value.data);
      print(loginModel!.userdata!.token);
      dummyProfile.name = loginModel!.userdata!.name!;
      dummyProfile.company = loginModel!.userdata!.company!;
      dummyProfile.position = loginModel!.userdata!.position!;
      dummyProfile.email = loginModel!.userdata!.email!;
      dummyProfile.id =loginModel!.userdata!.id!;
      dummyProfile.phone = loginModel!.userdata!.personalPhone!;
      CasheHelper.saveData(key: "id", value: loginModel!.userdata!.id!);
      CasheHelper.saveData(key: "phone", value: loginModel!.userdata!.personalPhone!);
      CasheHelper.saveData(key: "name", value: loginModel!.userdata!.name!);
      CasheHelper.saveData(key: "email", value: loginModel!.userdata!.email!);
      CasheHelper.saveData(key: "position", value:loginModel!.userdata!.position!);
      CasheHelper.saveData(key: "company", value:loginModel!.userdata!.company!);
      print(value.data);
      emit(ShopLoginSuccessState(loginModel!));

    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));

    });
  }

  void Start(context){
   if( CasheHelper.getData(key: 'user_id')!=null) {
     navigateTo(context, AppHomeLayout());
   }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ShopChangePasswordVisibilityState());
  }
}