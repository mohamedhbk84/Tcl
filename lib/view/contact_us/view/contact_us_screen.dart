import 'package:arab_project/controller/cubit/cubit.dart';
import 'package:arab_project/controller/cubit/states.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //  var userModel = AppCubit.get(context).userModel;

        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Contact Us'),
          // ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                          width: 150.0.w,
                          height: 100.0.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          )),
                    ),
                    Expanded(
                      child: Text('Your Sanitation & Hygiene Partner',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    height: 1.0.h,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Text(
                      'Al Qusais industrial area 3 P.O Box : 94988, Dubai - UAE',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: defaultButton(
                        btnText: 'info@tclgcc.com',
                        function: () async {
                          _sendMail();
                        },
                        toUppercase: false),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: defaultButton(
                        btnText: 'www.tclgcc.com',
                        function: () async {
                          _openEngine('http://www.tclgcc.com/');

                        },
                        toUppercase: false),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () async {
                        const url = 'https://www.facebook.com/tclgcc';
                        await _launchInWebViewWithJavaScript(url);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.purple,
                            Colors.pink,
                            Colors.orange,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () async {
                        _openEngine('https://www.instagram.com/tcl_detergents/');
                      },
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {
                        _openEngine("https://www.linkedin.com/company/tclgcc");
                      },
                      icon: Icon(
                        FontAwesomeIcons.linkedinIn,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () async {
                        _openEngine(
                            "https://api.whatsapp.com/send/?phone=%2B971554454435&text&app_absent=0");
                      },
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> _launchInWebViewWithJavaScript(String url) async {
  if (!await launch(
    url,
    forceSafariVC: true,
    forceWebView: true,
    enableJavaScript: true,
  )) {
    throw 'Could not launch $url';
  }
}

_sendMail() async {
  // Android and iOS
  const uri = 'mailto:info@tclgcc.com?subject=Greetings&body=Hello%20World';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

_openEngine(url) async {
  // url = 'https://www.google.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

