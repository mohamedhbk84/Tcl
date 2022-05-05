import 'package:arab_project/core/network/end_points.dart';
import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/Auth/Register_screen/model/register_model.dart';
import 'package:arab_project/view/Auth/login/model/login_model.dart';
import 'package:arab_project/view/Profile/cubit/profileStates.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() :super(AppInitProfileState());
  static ProfileCubit get(context)=> BlocProvider.of(context);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var companyController = TextEditingController();
  var positionController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  void getProfileInformation(){
    nameController.text = dummyProfile.name;
    emailController.text =dummyProfile.email;
    companyController.text = dummyProfile.company;
    positionController.text = dummyProfile.position;
    phoneController.text = dummyProfile.phone;
    passwordController.text = dummyProfile.password;
    emit(RefreshDataProfile());
  }
  LoginModel? loginModel;
  void userEdit({

    required String name,
    required String company,
    required String position,
    required String email,
    required String password,
     required String personal_phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: 'user/updateProfile?user_id=${dummyProfile.id}',
        data: {
      'name': name,
      'position': position,
      'company': company,
      'email': email,
      'personal_phone': personal_phone,
      'password': password,
      'password_confirmation': password,

    }).then((value) {
      // registerModel = RegisterModel.fromMap(value.data);
      print("nnnnnnnnnnnnnnnnnn");
      // loginModel = LoginModel.fromMap(value.data);
      // print(value.data);
      dummyProfile.name = name;
      dummyProfile.company = company;
      dummyProfile.position = position;
      dummyProfile.email = email;

      dummyProfile.phone = personal_phone;
      dummyProfile.password = password;
      showToast(
          msg: 'Edit successefuly', state: ToastStates.SUCCESS);
      print("nnnnnnnnnnnnnnnnnn");
      emit(RegisterSuccessState());
    }).catchError((error) {
      print("nooooooooooooooooooooooooooo");
      print(error.toString());
      showToast(
          msg: error.toString(), state: ToastStates.SUCCESS);
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
