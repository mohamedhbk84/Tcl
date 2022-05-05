import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/components/constants.dart';
import 'package:arab_project/shared/functions/remove_tags.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/cubit.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/states.dart';
import 'package:arab_project/view/technical_advices/view/product_details_advices_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductAdvicesScreen extends StatelessWidget {
  final bool isPromotion;
  final String appBarName;

  ProductAdvicesScreen({Key? key, required this.id, required this.isPromotion, required this.appBarName})
      : super(key: key);
  int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AdvicesCubit()..getAdvicesPromotionProductData(id),
      child: BlocConsumer<AdvicesCubit, AdvicesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AdvicesCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text("$appBarName"),
            ),
            body:
            ConditionalBuilder(
              condition: state is! AdvicesGetProductsLoadingState,
              builder: (context) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, left: 20.0, right: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 150.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Image(
                                      image: NetworkImage(
                                          BaseImageAdvices()+cubit.productsAdvicesModel!.adviceDetails!.imageLink!,),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0.w,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          '${cubit.productsAdvicesModel!.adviceDetails!.title}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        width: 200.w,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      if(cubit.productsAdvicesModel!.adviceDetails!.shortDesc!=null)
                                      Container(
                                        child: Text(
                                          '${cubit.productsAdvicesModel!.adviceDetails!.shortDesc}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        width: 205.w,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      // if (productDetails!.msds != null)
                                      //   defaultTextButton(
                                      //       text: '${productDetails!.msds}',
                                      //       color: Colors.red,
                                      //       function: () {}),
                                      if (cubit.productsAdvicesModel!.adviceDetails!.document != null)
                                      defaultTextButton(
                                          text: 'Download MSDS Certificate',
                                          color: Colors.red,
                                          function: () {
                                            openEngine(BasePDF()+cubit.productsAdvicesModel!.adviceDetails!.document!);
                                          }),
                                      if (cubit.productsAdvicesModel!.adviceDetails!.video != null)
                                        defaultTextButton(
                                            text:
                                                'Watch YouTube Video',
                                            color: Colors.red,
                                            function: () {
                                              openEngine(cubit.productsAdvicesModel!.adviceDetails!.video);
                                            }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if(cubit.productsAdvicesModel!.adviceDetails!.description!=null)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              '${removeAllHtmlTags(cubit.productsAdvicesModel!.adviceDetails!.description.toString())}',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 25),
                            child: Container(
                              child: Image(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                              height: 50.h,
                            ),
                          ),
                        ],
                      ),
                      if (cubit.productsAdvicesModel!.data!.length != null)
                        Align(
                        alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('Related Products',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                          )),
                      // Container(
                      //     child: Image(
                      //         height: 100,
                      //         width: 100,
                      //         image: NetworkImage(BaseImage()+cubit
                      //             .productsAdvicesModel!
                      //             .data![1]
                      //             .products!
                      //             .photoLink!))),
                      if (cubit.productsAdvicesModel!.data!.length != null)
                        Container(
                        height: 150.h,
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 10),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => cubit
                                          .productsAdvicesModel!
                                          .data![index]
                                          .products !=
                                      null
                                  ? Card(
                                      child: InkWell(
                                        onTap: () {
                                        navigateTo(context,ProductDetailsAdvices(id:cubit
                                            .productsAdvicesModel!
                                            .data![index]
                                            .products!
                                            .id !,) );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(

                                            children: [
                                              if (cubit
                                                      .productsAdvicesModel!
                                                      .data![index]
                                                      .products!
                                                      .name !=
                                                  null)
                                                Text(cubit
                                                    .productsAdvicesModel!
                                                    .data![index]
                                                    .products!
                                                    .name!),
                                              if (cubit
                                                      .productsAdvicesModel!
                                                      .data![index]
                                                      .products!
                                                      .photoLink !=
                                                  null)
                                                Container(
                                                    child: Image(
                                                        height: 100,
                                                        width: 100,
                                                        image: NetworkImage(BaseImage()+cubit
                                                            .productsAdvicesModel!
                                                            .data![index]
                                                            .products!
                                                            .photoLink!)))
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 3,
                                  ),
                              itemCount:
                                  cubit.productsAdvicesModel!.data!.length),
                        )
                    ],
                  ),
                );
              },
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),

          );
        },
      ),
    );
  }
}
