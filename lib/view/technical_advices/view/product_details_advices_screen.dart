
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/components/constants.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/cubit.dart';
import 'package:arab_project/view/technical_advices/controller/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsAdvices extends StatelessWidget {
  final int id;
  const ProductDetailsAdvices({Key? key,required this.id})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AdvicesCubit()..getAdvicesProductsDetails(id)..getEcommerceData(),
  child: BlocConsumer<AdvicesCubit, AdvicesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdvicesCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: state is! AdvicesGetDetailsLoadingState,
            builder: (context)=>SingleChildScrollView(
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
                                  image:
                                  NetworkImage(BaseImage()+'${cubit.advicesDetailsModel!.product!.photoLink}'),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 10.0.w,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      '${cubit.advicesDetailsModel!.product!.name}',
                                      style: Theme.of(context).textTheme.headline6,
                                    ),
                                    width: 200.w,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    child: Text(
                                      '${cubit.advicesDetailsModel!.product!.shortDesc}',
                                      style: Theme.of(context).textTheme.subtitle1,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    width: 205.w,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  if (cubit.advicesDetailsModel!.product!.msds != '')
                                    defaultTextButton(
                                        text: 'Download MSDS Certificate',
                                        color: Colors.red,
                                        function: () {
                                          openEngine(BasePDF()+cubit.advicesDetailsModel!.product!.msds!);
                                        }),
                                  if(cubit.advicesDetailsModel!.product!.youtubeId !=null)
                                    defaultTextButton(
                                        text: 'Watch YouTube Video',
                                        color: Colors.red,
                                        function: () {
                                          print(cubit.advicesDetailsModel!.product!.youtubeId);
                                          openEngine('${cubit.advicesDetailsModel!.product!.youtubeId}');
                                        }),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          '${cubit.advicesDetailsModel!.product!.shortDesc}',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          '${cubit.advicesDetailsModel!.product!.whereToUse}',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          '${cubit.advicesDetailsModel!.product!.howToUse}',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          '${cubit.advicesDetailsModel!.product!.avaliablePacking}',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 250.w,
                      ),
                      Container(
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        height: 50.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                      width: 130.w,
                      child: defaultButton(btnText: 'Shop Now', function: (){
                        openEngine("https://store.tclgcc.com/index.php?route=product/product&product_id=${cubit.productid}");
                      })),
                ],
              ),
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          ),
        );
      },
    ),
);
  }
}
