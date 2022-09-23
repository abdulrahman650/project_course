
import 'package:flutter/material.dart';

import 'Container/Open_Container.dart';

import 'Home1/home_page1.dart';
import 'Page.View/Page_view1.dart';
import 'Sign.in/Sign_in.dart';
import 'Tours/tours.dart';
import 'activate/Verification.dart';

void main() {


  // if(Firebase.apps.isEmpty){
  //   Firebase.initializeApp();
  // }else{
  //   Firebase.app();
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      home:Tour(),


    );
  }
}

