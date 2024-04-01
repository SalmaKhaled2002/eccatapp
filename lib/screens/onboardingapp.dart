import 'dart:math';
import 'package:eccatapp/screens/homepageapp.dart';
import 'package:flutter/material.dart';
import 'dart:async';




class OnBoarding_app extends StatefulWidget {
 

  @override
  State<OnBoarding_app> createState() => _MyHomeState();
}

class _MyHomeState extends State<OnBoarding_app> {
    @override
  void initState() {
    
    super.initState();
    Timer(const Duration(seconds:4), () { 
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage_app()));
    });
  }
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