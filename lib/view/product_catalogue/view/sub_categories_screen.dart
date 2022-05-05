import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/product_catalogue/model/categories_model.dart';
import 'package:arab_project/view/product_catalogue/view/Products_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoriesScreen extends StatelessWidget {
  final DataModel? model;

  SubCategoriesScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getSubCategories(model!.id),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     openEngine(
            //         "https://api.whatsapp.com/send/?phone=%2B971554454435&text&app_absent=0");
            //   },
            //   child: CircleAvatar(
            //     child: Image.asset(
            //       'assets/images/whatsapp.png',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   backgroundColor: Colors.greenAccent.shade700,
            //   shape: CircleBorder(
            //     side: BorderSide(width: 3.0, color: Colors.white),
            //   ),
            // ),
            //
            appBar: AppBar(
              title: Text('${model!.name}'),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetSubCategoryLoadingState &&
                  cubit.subCategoriesModel!.data!.data!.length != 0,
              builder: (context) => Column(
                children: [
                  headerWidget(context),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      primary: false,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: (1 / .9),
                      children: <Widget>[
                        for (int i = 0;
                            i <=
                                cubit.subCategoriesModel!.data!.data!.length -
                                    1;
                            i++)
                          defaultCat(
                              function: () {
                                navigateTo(
                                    context,
                                    ProductsScreen(
                                      model: cubit
                                          .subCategoriesModel!.data!.data![i],
                                    ));
                              },
                              catName: cubit
                                  .subCategoriesModel!.data!.data![i].name),
                      ],
                    ),
                  ),
                ],
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
