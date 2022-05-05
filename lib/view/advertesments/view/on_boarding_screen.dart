import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/core/network/local/cache_helper.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/layout/app_home_layout.dart';
import 'package:arab_project/view/start/start_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getOnBoarding(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! GetOnBoardingLoadingState,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image(
                          image: NetworkImage(
                              AppCubit.get(context).onBoardingModel!.data!.image!)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                      child: Center(
                        child: defaultButton(
                            btnText: 'Skip',
                            function: () {
                              CasheHelper.getData(key: 'user_id')==null?
                              navigateTo(context, StartScreen()):
                              navigateTo(context, AppHomeLayout());
                            }),
                      ),
                    )
                  ],
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
