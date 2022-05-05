import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/styles/colors.dart';
import 'package:arab_project/view/whatsapp/controller/WhatsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>WhatsAppCubit()..startScreen(context),
    child: BlocConsumer<WhatsAppCubit,WhatsAppStates>(
      listener: (context, state) {

      },
      builder: (context,state){
        var cubit =WhatsAppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [

            InkWell(
              onTap: () {
                cubit.startScreen(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: defaultColor,
                ),
                width: 150,
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                    Icon(Icons.whatsapp,size: 50,color: Colors.yellow,),

                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Whats App',
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ],),
          ),
        );
      },
    ),
    );

  }
}
