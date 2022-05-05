import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/product_catalogue/model/categories_model.dart';
import 'package:arab_project/view/product_catalogue/view/Products_screen.dart';
import 'package:arab_project/view/product_catalogue/view/sub_categories_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthCareSurfaceScreen extends StatelessWidget {
  final DataModel model;

   HealthCareSurfaceScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('${model.name}'),
          ),
          body: ConditionalBuilder(
            condition: state is! AppGetCategoryLoadingState,
            builder: (context) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  openEngine(
                      "https://api.whatsapp.com/send/?phone=%2B971554454435&text&app_absent=0");
                },
                child:CircleAvatar(child: Image.asset('assets/images/whatsapp.png',fit: BoxFit.cover,),),
                backgroundColor: Colors.greenAccent.shade700,
                shape: CircleBorder(
                  side: BorderSide(
                      width: 3.0,
                      color: Colors.white
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerWidget(context),
                    SizedBox(
                      height: 20,
                    ),
                    //search
                    // Padding(
                    //   padding: const EdgeInsets.all(20.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: Colors.grey.shade200,
                    //     ),
                    //     child: TextField(
                    //       showCursor: true,
                    //       readOnly: true,
                    //       onTap: () {
                    //         navigateTo(context, SearchScreen());
                    //       },
                    //       cursorColor: Theme.of(context).primaryColor,
                    //       style: TextStyle(color: defaultColor, fontSize: 12.sp),
                    //       decoration: const InputDecoration(
                    //           hintText: "Search...",
                    //           suffixIcon: Material(
                    //             elevation: 2.0,
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(30)),
                    //             child: Icon(Icons.search),
                    //           ),
                    //           border: InputBorder.none,
                    //           contentPadding: EdgeInsets.symmetric(
                    //               horizontal: 25, vertical: 13)),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            //skin care product
                            defaultCatWithImage(
                                cubit.categoriesModel!.data!.data![2].name,
                                'assets/images/skin.png', () {
                              navigateTo(
                                  context,
                                  SubCategoriesScreen(
                                    model:
                                        cubit.categoriesModel!.data!.data![2],
                                  ));
                            }),
                            SizedBox(
                              height: 10.h,
                            ),
                            //general cleaning product
                            defaultCatWithImage(
                                cubit.categoriesModel!.data!.data![0].name,
                                'assets/images/main2.png', () {
                              navigateTo(
                                  context,
                                  ProductsScreen(
                                    model: cubit
                                        .categoriesModel!.data!.data![0],
                                  ));
                            }),
                          ],
                        ),
                        SizedBox(
                          width: 20.0.w,
                        ),
                        Column(
                          children: [
                            //surface Distinction
                            defaultCatWithImage(
                                cubit.categoriesModel!.data!.data![1].name,
                                'assets/images/main2.png', () {
                              navigateTo(
                                  context,
                                  SubCategoriesScreen(
                                      model: cubit
                                          .categoriesModel!.data!.data![1]));
                            }),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

_callMe() async {
  // Android
  const uri = 'tel:+971 55 445 4435';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    // iOS
    const uri = 'tel:971-55-445-4435';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
