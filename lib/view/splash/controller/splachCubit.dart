
import 'dart:async';

import 'package:arab_project/view/advertesments/view/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class splachCubit extends Cubit<splachStates>{
  splachCubit(): super(appSplachState());
  static splachCubit get(context) => BlocProvider.of(context);



  void firstStart(context){
    Timer(
      const  Duration(seconds: 5),
          () => Navigator.of (context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>const OnBoardingScreen()),
      ),
    );
  }

}

abstract class splachStates {}
class appSplachState extends splachStates {}
class reloadscreen extends splachStates {}