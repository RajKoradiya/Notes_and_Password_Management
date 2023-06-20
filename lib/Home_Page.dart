import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Notes_Page.dart';
import 'PassWord_Page.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotesPage()));
              },
              child: Container(
                child: Center(child: Text("Notes", style: TextStyle(fontSize: 25, color: Colors.white),)),
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PassWordPage(),));
              },
              child: Container(
                child: Center(child: Text("Passwords", style: TextStyle(fontSize: 25, color: Colors.white),)),
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}