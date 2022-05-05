import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/core/bloc_observer.dart';
import 'package:arab_project/core/network/local/cache_helper.dart';
import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/shared/styles/themes.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/advertesments/view/on_boarding_screen.dart';
import 'package:arab_project/view/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  await Firebase.initializeApp();


// Wrap your app
  BlocOverrides.runZoned(
        () {
      // Use cubits...
      runApp(
        MyApp(), // Wrap your app
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({Key? key, this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: Init.instance.initialize(),
    //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return MaterialApp(
          //     debugShowCheckedModeBanner: false,
          //     home: SplashScreen(),
          //   );
          // } else {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (BuildContext context) =>
                    AppCubit()
                      ..getHomeCategories()
                      ..getCategories()..getSharedData()),
              ],
              child: BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ScreenUtilInit(
                      designSize: Size(360, 690),
                      builder: () =>
                          MaterialApp(
                            title: 'Flutter Demo',
                            theme: lightTheme,
                            darkTheme: darkTheme,
                            themeMode: ThemeMode.light,
                            home: SplashScreen(),
                            debugShowCheckedModeBanner: false,
                          ),
                    );
                  }),
            );
        //  }
       // }
   // );
  }
}
