import 'dart:math';

import 'package:flutter/material.dart';



void main() {
  runApp( About_App());
}
class About_App extends StatefulWidget {


  @override
  State<About_App> createState() => _MyHome();
}

class _MyHome extends State<About_App> {
   @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
     return 
    Scaffold(
     backgroundColor:Colors.blue,
     body:ListView(
       children: [
         Center(
           child: Container(
            padding: EdgeInsets.only(top:110,bottom: 30,left: 30,right: 30),
           child: ClipRRect(
            borderRadius:BorderRadius.circular(100),
            child: Image.asset("images/onboard.jpg",height: height*.3,width: 350)),
           ),
         ),
         Center(
           child: Container(
            padding: EdgeInsets.only(top: 60,right: 30,left:45),
           child: Column(
            children:[
           Text('Smart Wheel_Chair',
           style: TextStyle(color: Colors.white,
           fontSize: 30,
           fontStyle: FontStyle.italic,
           fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,),
            Text('Designed Smart for easy life and better health.',
            style: TextStyle(color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 25),
            ),
            ]
           )           
           ),
         ),
                  Center(
           child: Container(
            padding: EdgeInsets.only(top: 8,right: 30,left:45),
           child: Column(
            children:[
            Text('Version 1.1',
            style: TextStyle(color: Colors.white,
            fontSize: 10), 
            overflow: TextOverflow.ellipsis,),
            ]
           )           
           ),
         )
       ],
     ),
     
   
   );
  }
}