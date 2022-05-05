import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/core/network/local/cache_helper.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/styles/colors.dart';
import 'package:arab_project/view/contact_form_screen/controller/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ContactFormScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is postInquirySuccessState) {
            AppCubit.get(context).changeBottomNav(0);
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:EdgeInsets.all(0),
                        //const EdgeInsets.only(left: 70,right: 70,top: 30,bottom: 20),
                        child: Center(child: Container(
                            height: MediaQuery.of(context).size.height /5,
                            width:MediaQuery.of(context).size.width /2,
                            child: Image(image: AssetImage('assets/images/logo.png')))),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 60,
                          padding: EdgeInsetsDirectional.only(start: 8,end: 8),
                          child: DropdownButton(
                            hint: cubit.dropDownValue == null
                                ? Text('Select Field')
                                : Text(
                                    cubit.dropDownValue!,
                                    style: TextStyle(color: defaultColor),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: defaultColor),
                            items: [
                              'Product Inquiry',
                              'Services Inquiry',
                              'General Information'
                            ].map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (String? val) {
                              cubit.changeListInquiry(val);
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.top,
                            expands: true,
                              maxLines: null,
                              autofocus: true,
                              controller: messageController,
                            keyboardType: TextInputType.multiline,
                            validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Message Empty';
                                }
                              },decoration: InputDecoration(
                            hintText: 'Message',
                            border: OutlineInputBorder(),
                          ),


                              onTap: () {
                                print('message taped');
                              },
                          ),
                        ),
                      ),
                      ConditionalBuilder(
                        condition: state is! ContactFormLoadingState,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 20),
                            child: defaultButton(
                                btnText: 'Submit',
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.postInquiryForm(
                                      type:cubit.dropDownValue!,
                                         user_id: CasheHelper.getData(key: 'user_id'),
                                         message: messageController.text);
                                  }
                                },
                                toUppercase: true),
                          );
                        },
                        fallback: (context) =>
                            Center(child: const CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
