import 'package:arab_project/view/product_catalogue/model/products_model.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/styles/colors.dart';
import 'package:arab_project/view/product_catalogue/view/product_details_screen.dart';
import 'package:arab_project/view/search/controller/cubit/cubit.dart';
import 'package:arab_project/view/search/controller/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, ShopSearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                toolbarHeight: 60,
                title: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Row(
                    children: [
                      Container(
                        height: 35.h,
                        width: 200.w,
                        child: TextFormField(
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                          controller: searchController,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Search here',
                            hintStyle: TextStyle(fontSize: 15.sp),
                            prefixIcon: Icon(
                              Icons.search,
                              color: defaultColor,
                            ),
                          ),
                          onChanged: (value) {
                            cubit.getSearchData(text: value);
                          },
                        ),
                      ),
                       Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'CANCEL',
                            style: TextStyle(color:defaultColor),
                          )),
                    ],
                  ),
                ),
              ),
              body: state is ShopSearchLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : cubit.searchModel != null
                  ? searchController.text.isEmpty
                  ? Container()
                  : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: (){
                        navigateTo(
                            context,
                            ProductDetailsScreen(
                              productDetails:
                              cubit.searchModel!.dataModel!.data![index],
                            ));
                      },
                      child: buildProductItem(context,
                        cubit.searchModel!.dataModel!.data!
                        [index],),
                    ),
                separatorBuilder: (context, index) => myDivivder(),
                itemCount:
                cubit.searchModel!.dataModel!.data!.length,
              )
                  : Container());
        },
      ),
    );
  }

  Widget buildProductItem(context, ProductDetails model) =>
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 120.0.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                    '${model.photoLink}'
                ),
                width: 120.0.w,
                height: 120.0.h,
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1,
                    ),
                    SizedBox(
                      height: 15.0.h,
                    ),
                    Text(
                      '${model.shortDesc}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
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
}
