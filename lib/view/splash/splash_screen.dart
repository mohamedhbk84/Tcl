import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/splash/controller/splachCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../advertesments/view/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return BlocProvider(
        create: (BuildContext context) => splachCubit()..firstStart(context),
        child: BlocConsumer<splachCubit, splachStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: lightMode
                    ? const Color(0xffffffff)
                    : const Color(0xffffffff),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                          child: lightMode
                              ? Image.asset('assets/images/logo.png')
                              : Image.asset('assets/images/logo.png')),
                    ),

                  const  Text("Welcome at TCLGCC",style: TextStyle(color: Colors.black ,fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              );
            }));
  }
}
// class Init {
//   Init._();
//   static final instance = Init._();
//
//   Future initialize() async {
//
//     // This is where you can initialize the resources needed by your app while
//     // the splash screen is displayed.  Remove the following example because
//     // delaying the user experience is a bad design practice!
//     // await Future.delayed( Duration(seconds: 3)).then((value) {
//     //   navigateAndFinish(context, OnBoardingScreen());
//     // });
//   }
// }
