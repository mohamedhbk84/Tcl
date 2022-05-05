import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/core/network/local/cache_helper.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/Profile/cubit/profileCubit.dart';
import 'package:arab_project/view/Profile/cubit/profileStates.dart';
import 'package:arab_project/view/start/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  // var emailController = TextEditingController();
  // var phoneController = TextEditingController();
  // var passwordController = TextEditingController();
  // var passwordConfirmController = TextEditingController();

  var jobController = TextEditingController();
  var cityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
   return BlocProvider(create: (BuildContext context)=>ProfileCubit()..getProfileInformation(),
   child: BlocConsumer<ProfileCubit,ProfileStates>(
     listener: (context, state) {

     },
     builder: (context,state){
       var cubit = ProfileCubit.get(context);
       return Scaffold(
         backgroundColor:     Color(0xffB1D5E4),
         body: SingleChildScrollView(
           child: Container(

             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children:
               [
                 SizedBox(height: 20,),
                 Center(
                   child: Container(height: 100,width: 100,
                     decoration: BoxDecoration(color:Colors.grey, borderRadius: BorderRadius.circular(100),
                     ),
                     child: Icon(CupertinoIcons.profile_circled,size: 100,color: Colors.black54,),
                   ),
                 ),
                 SizedBox(height: 10,),

                 Padding(
                   padding:  EdgeInsets.only(left: 20,right: 10 ,top: 8, bottom: 2),
                   child: Text("Welcome", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:20 , right: 10),
                   child: Text("${dummyProfile.name} !", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 ),
                 SizedBox(height: MediaQuery.of(context).size.height *.05,),

                 editTextFormField(
                   controller: cubit.nameController,
                   type: TextInputType.name,
                   validate: (String? value) {
                     if (value!.isEmpty) {
                       return ' Name';
                     }
                   },
                   label: 'Name',
                 ),

                 editTextFormField(
                   controller: cubit.emailController,
                   type: TextInputType.name,
                   validate: (String? value) {
                     if (value!.isEmpty) {
                       return 'Email ';
                     }
                   },
                   label: 'Email',
                 ),
                 editTextFormField(
                   controller: cubit.companyController,
                   type: TextInputType.name,
                   validate: (String? value) {
                     if (value!.isEmpty) {
                       return 'Company Name';
                     }
                   },
                   label: 'Company',
                 ),
                 editTextFormField(
                   controller: cubit.phoneController,
                   type: TextInputType.phone,
                   validate: (String? value) {
                     if (value!.isEmpty) {
                       return 'Phone Name';
                     }
                   },
                   label: 'Phone',
                 ),
                 editTextFormField(
                   controller: cubit.positionController,
                   type: TextInputType.name,
                   validate: (String? value) {
                     if (value!.isEmpty) {
                       return 'Position';
                     }
                   },
                   label: 'Position',
                 ),
                 editTextFormField(
                   controller: cubit.passwordController,
                   validate: (String? value) {
                     if (value!.isEmpty) {

                       return 'password is too short';

                     }
                     return null;
                   },
                   type: TextInputType.visiblePassword,
                   // suffix:
                   // cubit.suffix,
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
                   // isPassword: cubit
                   //     .isPassword,
                   // suffixPressed: () {
                   //   cubit
                   //       .changePasswordVisibility();
                   // },

                   label: 'password',
                   // prefix: Icons.lock_outline,
                 ),
        const SizedBox(height: 20,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             GestureDetector(
               onTap: (){
                 cubit.userEdit(name: cubit.nameController.text,
                     company: cubit.companyController.text, position: cubit.positionController.text,
                     email: cubit.emailController.text , password: cubit.passwordController.text, personal_phone: cubit.phoneController.text);
               },
               child: Container(
                 height: 45,
                 width: MediaQuery.of(context).size.width /2.3,
                 decoration: BoxDecoration(color: Colors.blue , borderRadius: BorderRadius.circular(25)),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children:const [
                     Text("Edit", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),),
                     Icon(Icons.edit, color: Colors.white,),
                   ],),
               ),
             ),
             GestureDetector(
               onTap: (){
                 CasheHelper.removeData(key: "user_id").then((value) {
                 showToast(msg: 'Log Out', state: ToastStates.SUCCESS);
                   navigateTo(context,const StartScreen());});
               },
               child: Container(
                 height: 45,
                 width: MediaQuery.of(context).size.width /2.3,
                 decoration: BoxDecoration(color: Colors.blue , borderRadius: BorderRadius.circular(25)),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children:const [
                     Text("LogOut", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),),
                     Icon(Icons.logout, color: Colors.white,),
                   ],),
               ),
             ),

         ],),
                 const SizedBox(height: 20,),
               ],),
           ),
         ),
       );
     },
   ),
   );
  }
  // Widget RowText({context ,required String name ,required String dummyName}){
  //   return Center(
  //     child: Container(height: 40,width: MediaQuery.of(context).size.width -60,
  //       decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(25)),
  //       child: Center(child: Row(
  //         children: [
  //        const   SizedBox(width: 6,),
  //           // Text("$name : ",style:const TextStyle(fontWeight: FontWeight.bold),),
  //           Text(dummyName,style:const TextStyle(fontWeight: FontWeight.bold),),
  //         ],
  //       )),
  //     ),
  //   );
  // }
}
