
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eccatapp/pages/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
void main() {
  runApp( OnBoarding());
}
class OnBoarding extends StatefulWidget {
 

  @override
  State<OnBoarding> createState() => _MyHomeState();
}

class _MyHomeState extends State<OnBoarding> {
   @override
  void initState() {
    
    super.initState();
    Timer(const Duration(seconds:18), () { 
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Welcomepage()));
    });
  }

   @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin:Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [
            0.1,
            0.4,
            1,
          ],
          colors: [
            Color.fromARGB(255, 107, 105, 105),
            Color.fromARGB(255, 214, 214, 235),
            Color.fromARGB(255, 223, 193, 203),
          ]
        )
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,  
        body:Container(
        
        padding: EdgeInsets.only(top: 60),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedTextKit(
  animatedTexts: [
   TypewriterAnimatedText('ECCAT Smart_Wheel_Chair. ',textStyle: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.orangeAccent,
         overflow: TextOverflow.ellipsis
      ),
        
      speed: const Duration(milliseconds: 250),
    )],
    totalRepeatCount: 1,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            
         Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             
          children: [
            FittedBox(
              child: Image.asset("images/chair.png",
              height: 250,width: 200
              )),
            Container(
              child: AnimatedTextKit(
                animatedTexts: [
                 TypewriterAnimatedText('This chair is powered by electricity and it is designed to go upstaris. ',textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                      overflow: TextOverflow.ellipsis
                    ),
                      
                    speed: const Duration(milliseconds: 250),
                    
                  ),
                        
              
                
              
                ],
                 totalRepeatCount: 5,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
          
      Container(
  
  
            padding: EdgeInsets.only(top: 10,left: 180),
            child: Lottie.asset("assets/loading.json",height: 200,width: 400)),
          ],
    
      
         )) ]))));
      
  }
  }
  
