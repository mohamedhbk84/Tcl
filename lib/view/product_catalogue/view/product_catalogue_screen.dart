import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/health_care_surface_cleaning/view/health_care_surface_screen.dart';
import 'package:arab_project/view/product_catalogue/model/categories_model.dart';
import 'package:arab_project/view/product_catalogue/view/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCatalogueScreen extends StatelessWidget {
  const ProductCatalogueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
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

          appBar: AppBar(
            title: Text('Product Catalogue'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70,top: 30,bottom: 20),
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  primary: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: (1 / 1),
                  children: <Widget>[
                    for (int i = 0;
                        i <= cubit.homeCatModel!.data!.data!.length - 1;
                        i++)
                      defaultCat(
                        catName: cubit.homeCatModel!.data!.data![i].name, function:    (){
                        cubit.homeCatModel!.data!.data![i].id==1?
                        navigateTo(context, HealthCareSurfaceScreen(model: cubit.homeCatModel!.data!.data![i])):
                        navigateTo(context, SubCategoriesScreen(
                          model: cubit.homeCatModel!.data!.data![i],
                        ));

                      },),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Widget buildItemCat({
  required DataModel model, required Function function}) =>
    InkWell(
      onTap: () {
        function();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            model.name!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
