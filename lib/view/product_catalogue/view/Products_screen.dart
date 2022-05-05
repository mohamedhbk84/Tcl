import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/shared/components/constants.dart';
import 'package:arab_project/view/product_catalogue/model/categories_model.dart';
import 'package:arab_project/view/product_catalogue/model/products_model.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/product_catalogue/view/product_details_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  final DataModel? model;

  ProductsScreen({Key? key,this.model,id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getProductsData(model!.id),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('${model!.name}'),
                ),
            body: ConditionalBuilder(
              condition: state is! AppGetProductLoadingState,
              builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: buildProductItem(
                          context,
                          cubit.productsModel!.dataModel!.data![index]),
                      onTap: () {
                        navigateTo(
                            context,
                            ProductDetailsScreen(
                              productDetails:
                                  //  cubit.productsModel!.dataModel!.data![index],
                                  cubit.productsModel!.dataModel!.data![index],
                            ));
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 15.0.w,
                      ),
                  itemCount: cubit.productsModel!.dataModel!.data!.length),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}

Widget buildProductItem(context, ProductDetails model) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 120.0.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (model.photoLink != null)
              FadeInImage(
                image: Image.network(
                  BaseImage()+model.photoLink!,
                  errorBuilder: (BuildContext context, Object? exception,
                      StackTrace? stackTrace) {
                    return Image(image: AssetImage('assets/images/logo.png'));
                  },
                  fit: BoxFit.cover,
                ).image,
                width: 120.0.w,
                height: 100.0.h,
                placeholder: AssetImage('assets/images/logo.png'),
              ),
            if (model.photoLink == null)
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 120.0.w,
                height: 100.0.h,
              ),
            SizedBox(
              width: 20.0.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${model.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Text(
                    '${model.shortDesc}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  // const Spacer(),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.0.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
