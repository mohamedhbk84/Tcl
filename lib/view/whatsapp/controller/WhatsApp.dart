import 'dart:async';

import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/styles/styles.dart';
import 'package:arab_project/view/Auth/login/view/shop_login_screen.dart';
import 'package:arab_project/view/layout/app_home_layout.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhatsAppCubit extends Cubit<WhatsAppStates>{
  WhatsAppCubit():super(AppInitWhatsAppState());
  static WhatsAppCubit get(context)=> BlocProvider.of(context);

  void startScreen(context) async{

    openEngine("tel:%2B971554454435");
      //  "https://api.whatsapp.com/send/?phone=%2B971554454435&text&app_absent=0");
    Timer.periodic(Duration(seconds: 4), (Timer t) {
       currentIndex =0;
     navigateAndFinish(context, AppHomeLayout());
    });

    emit(ReloadScreen());
  }
}
abstract class WhatsAppStates{}
class AppInitWhatsAppState extends WhatsAppStates{}
class ReloadScreen  extends WhatsAppStates {}