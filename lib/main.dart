import 'package:chat_iti/layout/home.dart';
import 'package:chat_iti/modules/login/login_screen.dart';
import 'package:chat_iti/network/local/cache_helper.dart';
import 'package:chat_iti/shared/constant/Chato.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token= await FirebaseMessaging.instance.getToken();
  print('token: $token');
  await CacheHelper.init();

  Widget widget;

  uId=CacheHelper.getData(key: 'uId');

  if(uId != null)
    {
      print(uId);
      print('from main');
      widget= HomeScreen();
    }
  else
  {
    widget=Login();
  }
  runApp( MyApp(
    startWidget:widget
  ));
}

class MyApp extends StatelessWidget {
 final Widget? startWidget;

const MyApp({this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff151718),
        appBarTheme: AppBarTheme(
          toolbarHeight: 70,
          backgroundColor: Color(0xff151718),
          iconTheme: IconThemeData(
              color: Color(0xff006d77) ,
            size: 30,
          )
        )
      ),
      home:startWidget


    );
  }
}




