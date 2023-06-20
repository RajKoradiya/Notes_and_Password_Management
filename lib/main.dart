// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_and_password/title_page.dart';

void main() {
  runApp(MySplashScreen());
}

class MySplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SplashScreen",
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black87,
            child: Center(
              child: Image.asset("assets/image/Icon.png",
                height: 100,
                width: 100,
              ),
            )
        ),
      ),
    );
  }

  void whereToGo() {
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TitlePage(),));
    });
  }
//
}

