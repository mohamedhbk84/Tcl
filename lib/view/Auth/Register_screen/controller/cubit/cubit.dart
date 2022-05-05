import 'package:arab_project/core/network/end_points.dart';
import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/view/Auth/Register_screen/controller/cubit/states.dart';
import 'package:arab_project/view/Auth/Register_screen/model/register_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? registerModel;

  void userRegister({
    required String? name,
    required String? company,
    required String? position,
    required String? email,
    required String? password,
    required String? password_confirmation,
    required String? personal_phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, data: {
      'name': name,
      'position': position,
      'company': company,
      'email': email,
      'personal_phone': personal_phone,
      'password': password,
      'password_confirmation': password_confirmation,
    }).then((value) {
      registerModel = RegisterModel.fromMap(value.data);
      print(value.data);
      emit(RegisterSuccessState(model: registerModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
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
