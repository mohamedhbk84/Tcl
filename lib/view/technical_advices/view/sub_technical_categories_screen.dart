import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/cubit.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/states.dart';
import 'package:arab_project/view/technical_advices/model/TechnicalAdvicesModel.dart';
import 'package:arab_project/view/technical_advices/view/advices_product_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubTechnicalAdvicesScreen extends StatelessWidget {
  final TechnicalData? model;
  final bool isPromotion;

  SubTechnicalAdvicesScreen(
      {Key? key, required this.model, required this.isPromotion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AdvicesCubit()..getSubTechnicalAdvicesCategories(model!.id),
      child: BlocConsumer<AdvicesCubit, AdvicesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AdvicesCubit.get(context);
          return Scaffold(

            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     openEngine(
            //         "https://api.whatsapp.com/send/?phone=%2B971554454435&text&app_absent=0");
            //   },
            //   child: CircleAvatar(
            //     child: Image.asset(
            //       'assets/images/whatsapp.png',
            //     ),
            //   ),
            //   backgroundColor: Colors.greenAccent.shade700,
            //   shape: CircleBorder(
            //     side: BorderSide(width: 3.0, color: Colors.white),
            //   ),
            // ),
            appBar: AppBar(
              title: Text('${model!.name}'),
            ),
            body: ConditionalBuilder(
              condition: state is! AdvicesGetSubTechnicalAdvicesLoadingState,
              builder: (context) => Column(
                children: [
                  headerWidget(context),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                //    child: GridView.count(
                    child: ListView.builder(
                        itemCount: cubit.subTechnicalAdvicesModel!
                            .advicessMaterial!.data!.length,
                        itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            navigateTo(
                                context,
                                // ProductAdvicesScreen(
                                //   isPromotion: isPromotion,
                                //   id: cubit.subTechnicalAdvicesModel!
                                //       .advicessMaterial!.data![i].id!,
                                // )
                                ProductAdvicesScreen(
                                isPromotion: isPromotion,
                                id: cubit.subTechnicalAdvicesModel!
                                    .advicessMaterial!.data![index].id!,
                                appBarName: cubit.subTechnicalAdvicesModel!.advicessMaterial!.data![index].name!));
                          },
                          child: Card(
                            elevation: 4,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Row(
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(cubit.subTechnicalAdvicesModel!
                                          .advicessMaterial!.data![index].name.toString(),style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

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
