import 'package:arab_project/view/Auth/Register_screen/model/register_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterModel model;

  RegisterSuccessState({required this.model});
}

class RegisterErrorState extends RegisterStates {}

//user create
class UserCreateLoadingState extends RegisterStates {}

class UserCreateSuccessState extends RegisterStates {}

class UserCreateErrorState extends RegisterStates {
  final String error;

  UserCreateErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends RegisterStates {}
