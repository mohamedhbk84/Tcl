import 'package:arab_project/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

Widget defaultButton({
  double btnWidth = double.infinity,
  bool toUppercase = true,
  required String btnText,
  required Function function,
}) =>
    Container(
      width: btnWidth,
      decoration: BoxDecoration(
          color: defaultColor, borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        height: 40,
        onPressed: () {
          function();
        },
        child: Text(toUppercase ? btnText.toUpperCase() : btnText),
        textColor: Colors.white,
      ),
    );

Widget defaultTextButton({
  required String text,
  required Function function,
  double? size,
  Color? color}) =>
    TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: size ?? 10,
          ),
        ));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  required String? Function(String? value) validate,
  required String label,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPressed,
  Function? onTap,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        child: TextFormField(
          obscureText: isPassword,
          controller: controller,
          keyboardType: type,
          onFieldSubmitted: (s) {
            onSubmit!(s);
          },
          validator: validate,
          // onTap: () {
          //   onTap!();
          // },
          // onChanged: (s) {
          //   onChange!(s);
          // },
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(prefix),
            suffixIcon: suffix != null
                ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(suffix))
                : null,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
Widget editTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  required String? Function(String? value) validate,
  required String label,
}){
  return  Padding(
    padding: const EdgeInsets.only(left: 25,right: 25, top: 10,bottom: 10),
    child: Container(

      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
          controller: controller,
          keyboardType: type,
          onFieldSubmitted: (s) {
            onSubmit!(s);
          },
          validator: validate,
          decoration: InputDecoration(
              labelText: label,

              border:const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
              contentPadding: EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.black),
              )
          )
      ),
    ),
  );
}

Widget buildTaskItem(Map model, context) =>
    Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${model['title']}'),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                //  AppCubit.get(context).updateDatabase(model['id'], 'done');
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
                onPressed: () {
                  //  AppCubit.get(context).updateDatabase(model['id'], 'archive');
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.black26,
                )),
          ],
        ),
      ),
      onDismissed: (direction) {
        //   AppCubit.get(context).deleteDatabase(model['id']);
      },
    );

Widget tasksBuilder(List<Map> tasks) {
  return ConditionalBuilder(
    condition: tasks.length > 0,
    builder: (context) =>
        ListView.separated(
            itemBuilder: (context, index) =>
                buildTaskItem(tasks[index], context),
            separatorBuilder: (context, index) =>
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0),
                  child: Container(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
            itemCount: tasks.length),
    fallback: (context) =>
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.ac_unit_sharp),
              Text('nothing in Tasks Please Add one')
            ],
          ),
        ),
  );
}

Widget buildArticleItem(articles, context) =>
    InkWell(
      onTap: () {
        //  navigateTo(context, WebViewScreen(articles['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${articles['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${articles['title']}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${articles['publishedAt']}',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivivder() =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) =>
          ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildArticleItem(list[index], context),
              separatorBuilder: (context, index) => myDivivder(),
              itemCount: list.length),
      fallback: (context) =>
      isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });

void showToast({required String msg, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget headerWidget(context) =>
    Column(
      children: [
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6),
            ),
          ],
        ),

      ],
    );

Widget defaultCatWithImage(catName, image, Function function) =>
    InkWell(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: defaultColor,
        ),
        width: 150.w,
        height: 140.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image(
                  color: Colors.white,
                  image: AssetImage(image),
                  width: 60.0.w,
                  height: 60.0.h,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                '$catName',
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget defaultCat({required catName,required Function function}) =>
    InkWell(
      onTap: (){
        function();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: defaultColor,
        ),
        width: 150.w,
        height: 140.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '$catName',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
          ),
        ),
      ),
    );

void callMe() async {
  // Android
  const uri = 'tel:+971 55 445 4435';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    // iOS
    const uri = 'tel:971-55-445-4435';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
openEngine(url) async {
  // url = 'https://www.google.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
