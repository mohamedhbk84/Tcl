import 'package:arab_project/core/network/local/cache_helper.dart';
import 'package:arab_project/shared/styles/colors.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/Auth/Register_screen/view/register_screen.dart';
import 'package:arab_project/view/Auth/login/controller/cubit/cubit.dart';
import 'package:arab_project/view/Auth/login/controller/cubit/states.dart';
import 'package:arab_project/view/layout/app_home_layout.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arab_project/shared/components/components.dart';


class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit()..Start(context),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status=='Login successefuly') {

              CasheHelper.saveData(key: "password", value: passwordController.text);
              dummyProfile.password =passwordController.text;
              CasheHelper.saveData(
                      key: 'user_id', value: state.loginModel.userdata!.id)
                  .then((value) {
                    print(CasheHelper.getData(key: 'user_id'));
              navigateAndFinish(context, AppHomeLayout());
                showToast(
                    msg: 'Login successefuly', state: ToastStates.SUCCESS);
              });
            }
          } else if (state is ShopLoginErrorState){
            showToast(
                msg: 'Invalid Email or Password', state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),

                        child: Container(
                            height: MediaQuery.of(context).size.height /4,
                            width:MediaQuery.of(context).size.width /2,
                            child: Image(image: AssetImage('assets/images/logo.png'))),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: defaultColor,

                        ),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Login',
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Colors.white,

                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          onTap: () {
                            print('email taped');
                          }),
                     defaultFormField(
                        controller: passwordController,
                        validate: (String? value) {
                          if (value!.isEmpty) {

                            return 'password is too short';

                          }
                          return null;
                        },
                        type: TextInputType.visiblePassword,
                        suffix:
                        cubit.suffix,
                        onSubmit: (value) {
                          // if (formKey.currentState!
                          //     .validate()) {
                          //   // ShopLoginCubit.get(context)
                          //   //     .userLogin(
                          //   //   phone: phoneController.text,
                          //   //   password: passwordController.text,
                          //   );
                          // }
                        },
                        isPassword: cubit
                            .isPassword,
                        suffixPressed: () {
                          cubit
                              .changePasswordVisibility();
                        },

                        label: 'password',
                        prefix: Icons.lock_outline,
                      ),
                    const  SizedBox(height: 5,),
                      Row(children: [
                        defaultTextButton(
                            text: 'Forgot Account ?',
                            size: 16,
                            color: Colors.black,
                            function: () {

                            }),
                      ],),
                      const SizedBox(
                        height: 25.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopLoginLoadingState,
                        builder: (context) {
                          return defaultButton(
                              btnText: 'login',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              toUppercase: true);
                        },
                        fallback: (context) =>
                            Center(child: const CircularProgressIndicator()),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t Have Account'),
                          defaultTextButton(
                              text: 'REGISTER',
                              size: 16,
                              function: () {
                                navigateTo(context, RegisterScreen());
                              }),
                        ],
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
