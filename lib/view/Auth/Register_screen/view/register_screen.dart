
import 'package:arab_project/core/network/local/cache_helper.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/styles/colors.dart';
import 'package:arab_project/view/Auth/Register_screen/controller/cubit/cubit.dart';
import 'package:arab_project/view/Auth/Register_screen/controller/cubit/states.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';

import 'package:arab_project/view/Auth/login/view/shop_login_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  //////  name  /// full name /////  email ///// company ///
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var companyController = TextEditingController();
  var positionController = TextEditingController();
  var jobController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.model.status == 'Data added successefuly') {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Thanks for your registration,'),
                  content: Text(
                      " your request has been submitted to TCL administration,Please check your email inbox for email verification"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => navigateTo(context, ShopLoginScreen()),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              );
            }
          }else {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Email is in Use'),
                content: Text(
                    "You Already Have Account "),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => navigateTo(context, ShopLoginScreen()),
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                           // left: 50, right: 50, bottom: 20),
                        child:
                            Center(
                              child: Container(
                                  height: MediaQuery.of(context).size.height /4.5,
                                  width:MediaQuery.of(context).size.width /2.1,
                                  child: Image(image: AssetImage('assets/images/logo.png'))),
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: defaultColor,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Register',
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
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Full Name';
                            }
                          },
                          label: 'Name',
                          prefix: Icons.person,
                          onTap: () {
                            print('name taped');
                          }),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                          },
                          label: 'Email',
                          prefix: Icons.email_outlined,
                          onTap: () {
                            print('email taped');
                          }),
                      defaultFormField(
                        controller: passwordController,
                        validate: (String? value) {
                          if (value!.isEmpty || value.length < 8) {
                            return 'password is too short';
                          }

                          return value.length < 8
                              ? 'Password must be greater 8'
                              : null;
                        },
                        type: TextInputType.visiblePassword,
                        suffix: cubit.suffix,
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
                        isPassword: cubit.isPassword,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        label: 'password',
                        prefix: Icons.lock_outline,
                      ),
                      defaultFormField(
                        controller: passwordConfirmController,
                        validate: (String? value) {
                          if (value!.isEmpty && value.length < 8) {
                            return 'password is too short at least 8 characters';
                          }
                          if (value != passwordController.text) {
                            return 'password is not the same confirmation';
                          }
                          return value.length < 8
                              ? 'Password must be greater 8'
                              : null;

                        },
                        type: TextInputType.visiblePassword,
                        suffix: cubit.suffix,
                        onSubmit: (value) {},
                        isPassword: cubit.isPassword,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        label: 'confirm password',
                        prefix: Icons.lock_outline,
                      ),
                      defaultFormField(
                          controller: companyController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Company Name';
                            }
                          },
                          label: 'Company',
                          prefix: Icons.business,
                          onTap: () {
                            print('company taped');
                          }),
                      defaultFormField(
                          controller: positionController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Company Name';
                            }
                          },
                          label: 'Position',
                          prefix: Icons.business,
                          onTap: () {
                            print('Position taped');
                          }),
                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Phone';
                            }
                          },
                          label: 'Mobile Number',
                          prefix: Icons.phone,
                          onTap: () {
                            print('phone taped');
                          }),
                      Container(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                //Optional. Sets the border radius for the bottomsheet.
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                //Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: defaultColor,
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (Country picked) {
                                print(picked.displayName);
                              },
                            );
                          },
                          child: Text('Pick Your Country'),
                        ),
                      ),
                      defaultFormField(
                          controller: cityController,
                          type: TextInputType.streetAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your City';
                            }
                          },
                          label: 'City',
                          prefix: Icons.location_city,
                          onTap: () {
                            print('city taped');
                          }),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: defaultButton(
                                btnText: 'Submit',
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userRegister(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        password_confirmation:
                                            passwordConfirmController.text,
                                        company: companyController.text,
                                        position: positionController.text,
                                        name: nameController.text,
                                        personal_phone: phoneController.text);

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
