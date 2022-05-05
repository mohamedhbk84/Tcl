
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/Auth/Register_screen/view/register_screen.dart';
import 'package:arab_project/view/Auth/login/view/shop_login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                    height: MediaQuery.of(context).size.height /4,
                    width:MediaQuery.of(context).size.width /1.8,
                    child: Image(image: AssetImage('assets/images/logo.png'))),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome to TCL Mobile Application',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,

              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultTextButton(
                      text: 'Login',
                      size: 20,
                      color: Colors.black,
                      function: () {
                        navigateTo(context, ShopLoginScreen());
                        //showToast(msg: 'Login successefuly', state: ToastStates.SUCCESS);
                      }),
                  Text('or'),
                  defaultTextButton(
                      text: 'Sign up',
                      size: 20,
                      color: Colors.black,
                      function: () {
                        navigateTo(context, RegisterScreen());
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
