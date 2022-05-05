import 'dart:async';
import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/styles/styles.dart';
import 'package:arab_project/view/calender/add_Calender.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppHomeLayout extends StatefulWidget {
   AppHomeLayout({Key? key}) : super(key: key);

  @override
  State<AppHomeLayout> createState() => _AppHomeLayoutState();
}

class _AppHomeLayoutState extends State<AppHomeLayout> {
   String _connectionStatus = 'Unknown';

   final Connectivity _connectivity = Connectivity();

   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

   @override
   void initState() {
     super.initState();
     initConnectivity();
     _connectivitySubscription =
         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
   }

   @override
   void dispose() {
     _connectivitySubscription.cancel();
     super.dispose();
   }

   // Platform messages are asynchronous, so we initialize in an async method.
   Future<void> initConnectivity() async {
     ConnectivityResult result = ConnectivityResult.none;
     // Platform messages may fail, so we use a try/catch PlatformException.
     try {
       result = await _connectivity.checkConnectivity();
     } on PlatformException catch (e) {
       print(e.toString());
     }

     if (!mounted) {
       return Future.value(null);
     }

     return _updateConnectionStatus(result);
   }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //
          //
          //   },
          //   child:CircleAvatar(child: Image.asset('assets/images/whatsapp.png',fit: BoxFit.cover,),),
          //   backgroundColor: Colors.greenAccent.shade700,
          //   shape: CircleBorder(
          //     side: BorderSide(
          //         width: 3.0,
          //         color: Colors.white
          //     ),
          //   ),
          // ),

          appBar: AppBar(
            title: Text(cubit.titles![currentIndex]),
            centerTitle: true,
            backgroundColor: cubit.titles![currentIndex] == "Profile"?Color(0xffB1D5E4):Colors.white,
                 leading: cubit.titles![currentIndex] == "Calender" ?   IconButton(onPressed: (){
                 navigateTo(context, AddNotes());
            }, icon:const Icon(Icons.add)):Text(''),
          ),
          body: cubit.screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 10,
            currentIndex: currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
              BottomNavigationBarItem(icon: Icon(Icons.app_registration),label: 'Inquiry'),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined),label: 'Calender'),
              BottomNavigationBarItem(icon: Icon(Icons.whatsapp),label: 'Whats'),
              BottomNavigationBarItem(icon: Icon(Icons.contact_phone_sharp),label: 'Call us'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
            ],),
        );
      },
    );
  }

   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
     switch (result) {
       // case ConnectivityResult.wifi: showToast(msg: 'Wifi Connected', state: ToastStates.SUCCESS);
       // break;

       case ConnectivityResult.mobile:showToast(msg: 'Mobile data Connected', state: ToastStates.SUCCESS);
       break;
       case ConnectivityResult.none:showToast(msg: 'No Internet', state: ToastStates.ERROR);
       break;

       setState(() => _connectionStatus = result.toString());
       default:
         setState(() => _connectionStatus = 'Failed to get connectivity.');
         break;
     }
   }
}

