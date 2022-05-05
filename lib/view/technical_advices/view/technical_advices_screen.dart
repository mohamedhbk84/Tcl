import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/product_catalogue/model/categories_model.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/cubit.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/states.dart';
import 'package:arab_project/view/technical_advices/view/sub_technical_categories_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechnicalAdvicesScreen extends StatelessWidget {
  final bool isPromotion;
  const TechnicalAdvicesScreen({Key? key,required this.isPromotion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AdvicesCubit()..getTechnicalAdvicesCategories(),
      child: BlocConsumer<AdvicesCubit, AdvicesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AdvicesCubit.get(context);
          if(!isPromotion){
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
              appBar: AppBar(
                title: Text('Technical Advices'),
              ),
              body: ConditionalBuilder(
                condition: state is! AdvicesGetTechnicalAdvicesLoadingState,
                builder: (BuildContext context)=>Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      // padding: const EdgeInsets.only(
                      //     left: 70, right: 70, top: 30, bottom: 20),
                      child: Container(
                          height: MediaQuery.of(context).size.height /4,
                          width:MediaQuery.of(context).size.width /2,
                          child: Image(image: AssetImage('assets/images/logo.png'))),
                    ),
                    Expanded(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        primary: true,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),

                        itemCount:  cubit.advices!.length ,
                        itemBuilder: (BuildContext context, int index) {
                          return    defaultCat(

                               function: () {
                                 navigateTo(
                                     context,
                                     SubTechnicalAdvicesScreen(
                                       isPromotion: isPromotion,
                                       model: cubit.advices![index],
                                     ));
                               }, catName: cubit.advices![index].name);
                        },

                        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: (1 / 1),
                        ),

                      ),
                    )
                  ],
                ),
                fallback: (BuildContext context)=>Center(child: CircularProgressIndicator()),

              ),
            );
          }
          else if(isPromotion){
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
              appBar: AppBar(
                title: Text('Promotion Offers'),
              ),
              body: ConditionalBuilder(
                condition: state is! AdvicesGetTechnicalAdvicesLoadingState,
                builder: (BuildContext context)=>Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
    Center(
                      // padding: const EdgeInsets.only(
                      //     left: 70, right: 70, top: 30, bottom: 20),
                      child: Container(
                          height: MediaQuery.of(context).size.height /5,
                          width:MediaQuery.of(context).size.width /2,
                          child: Image(image: AssetImage('assets/images/logo.png'))),
                    ),
                    Expanded(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        primary: true,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),

                        itemCount:  cubit.promotion!.length ,
                        itemBuilder: (BuildContext context, int index) {
                          return    defaultCat(

                             function:  () {
                          navigateTo(
                              context,
                              SubTechnicalAdvicesScreen(
                                isPromotion: isPromotion,
                                model: cubit.promotion![index],
                              ));
                          }, catName:  cubit.promotion![index]
                          .name);
                        },

                        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: (1 / 1),
                        ),

                      ),
                    )
                  ],
                ),
                fallback: (BuildContext context)=>Center(child: CircularProgressIndicator()),

              ),
            );
          }
          else{
            return Center(child: Text('No Data Found'),);
          }
        },
      ),
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
