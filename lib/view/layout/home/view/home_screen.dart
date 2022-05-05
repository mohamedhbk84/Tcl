import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/contact_us/view/contact_us_screen.dart';
import 'package:arab_project/view/product_catalogue/model/categories_model.dart';
import 'package:arab_project/view/product_catalogue/view/product_catalogue_screen.dart';
import 'package:arab_project/view/technical_advices/view/technical_advices_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstHomeScreen extends StatelessWidget {
  const FirstHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                      // left: 70, right: 70, top: 30, bottom: 20),
                  child: Center(child: Container(
                      height: MediaQuery.of(context).size.height /5,
                      width:MediaQuery.of(context).size.width /2,
                      child: Image(image: AssetImage('assets/images/logo.png')))),
                ),
                Expanded(
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    primary: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: (1 / .9),
                    children: <Widget>[
                      defaultCatWithImage(
                          'Product Catalogue', 'assets/images/oil.png', () {
                        navigateTo(context, ProductCatalogueScreen());
                      }),
                      defaultCatWithImage(
                          'Technical Advices', 'assets/images/techadvice.png', () {
                            navigateTo(context, TechnicalAdvicesScreen(isPromotion: false,));
                      }),
                      defaultCatWithImage(
                          'Training Video', 'assets/images/youtube.png', () {
                        openEngine('https://www.youtube.com/c/TCLGCC');
                      }),

                      defaultCatWithImage(
                          'Promotion Offers', 'assets/images/offer.png', () {
                            navigateTo(context,TechnicalAdvicesScreen(isPromotion: true,));
                      }),
                      defaultCatWithImage('Request For Services',
                          'assets/images/requestforservice.png', () {
                        cubit.changeBottomNav(1);
                          }),
                      defaultCatWithImage(
                          'Contact Us', 'assets/images/contact.png', () {
                        navigateTo(context, ContactUsScreen());
                      }),
                      // buildItemCat(
                      //   model: cubit.homeCatModel!.data!.data![i], function: (){
                      //   cubit.homeCatModel!.data!.data![i].id==1?
                      //   navigateTo(context, AppHomeLayout()):
                      //   navigateTo(context, SubCategoriesScreen(
                      //     id: cubit.homeCatModel!.data!.data![i].id!,
                      //   ));
                      //
                      // },
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildItemCat({required DataModel model, required Function function}) =>
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

