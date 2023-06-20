// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_and_password/signup_page.dart';
import 'login_page.dart';

class TitlePage extends StatefulWidget {
  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> with SingleTickerProviderStateMixin{

  late Animation animation;
  late Animation animation2;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: 0.0,end: 650.0).animate(animationController);
    animation2 = Tween(begin: 0.0,end: 1.0).animate(animationController);
    animationController.addListener(() {
      setState(() {

      });
    });
    animationController.forward();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                "Title",
              )),
          backgroundColor: Colors.black87,
        ),
        body: Center(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(seconds: 2),
                  height: animation.value == 0.0 ? 0.0 : 650.0,
                  left: 0,
                  right: 0,
                  bottom: animation.value == 0.0 ? 0.0 : 1.0,
                  curve: Curves.easeInOut,

                  child: Image.asset(
                    "assets/image/frame1.png",
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: animation2.value,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        shadowColor: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Welcome to Notes and Password",style: TextStyle(fontSize: 30),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(onPressed: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                                    }, child: Text("Login", style: TextStyle(fontSize: 20),)),
                                    SizedBox(width: 15,),
                                    ElevatedButton(onPressed: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                                    }, child: Text("Signup", style: TextStyle(fontSize: 20),)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
