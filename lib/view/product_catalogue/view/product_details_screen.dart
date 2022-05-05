import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/shared/components/constants.dart';
import 'package:arab_project/view/product_catalogue/model/products_model.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productDetails})
      : super(key: key);
  final ProductDetails? productDetails;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
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
                                    NetworkImage(BaseImage()+productDetails!.photoLink!),
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
                                    '${productDetails!.name}',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  width: 200.w,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  child: Text(
                                    '${productDetails!.shortDesc}',
                                    style: Theme.of(context).textTheme.subtitle1,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  width: 205.w,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                if (productDetails!.msds != '')
                                  defaultTextButton(
                                      text: 'Download MSDS Certificate',
                                      color: Colors.red,
                                      function: () {
                                        openEngine(BasePDF()+productDetails!.msds!);
                                      }),
                                if(productDetails!.youtubeId !=null)
                                defaultTextButton(
                                    text: 'Watch YouTube Video',
                                    color: Colors.red,
                                    function: () {
                                      openEngine('${productDetails!.youtubeId}');
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
                        '${productDetails!.longDesc}',
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
                        '${productDetails!.whereToUse}',
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
                        '${productDetails!.howToUse}',
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
                        '${productDetails!.avaliablePacking}',
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
                      openEngine('https://www.tclgcc.com/product/item/'+productDetails!.slug.toString());
                    })),
              ],
            ),
          ),
        );
      },
    );
  }
}
