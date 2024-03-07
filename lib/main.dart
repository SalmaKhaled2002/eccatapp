
import 'dart:io';

import 'package:eccatapp/aboutapp.dart';
import 'package:eccatapp/auth/loginnn.dart';
import 'package:eccatapp/auth/ssignup.dart';

import 'package:eccatapp/camera.dart';

import 'package:eccatapp/contactus.dart';

import 'package:eccatapp/info.dart';


import 'package:eccatapp/location.dart';
import 'package:eccatapp/map.dart';
import 'package:eccatapp/myprofile.dart';
import 'package:eccatapp/patientinfo.dart';
import 'package:eccatapp/forgetpassword.dart';
import 'package:eccatapp/auth/login.dart';
import 'package:eccatapp/onboarding.dart';

import 'package:eccatapp/resetpassword.dart';
import 'package:eccatapp/auth/signup.dart';

import 'package:eccatapp/test.dart';
import 'package:eccatapp/voice.dart';
import 'package:eccatapp/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:'AIzaSyDTaxY9jOFDcFrKaoYpsUqrPYosQgfZKl8' ,
       appId: '1:573000768652:android:4923f1eb60b0982404efa9', 
       messagingSenderId: '573000768652',
        projectId: 'vscodeflutter-346d2')
  )
  :await Firebase.initializeApp();
  
  runApp( MyApp());
}



class MyApp extends StatefulWidget {
 

  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
    print('ok');
  });
    super.initState();

    //done




    
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      home: 
      FirebaseAuth.instance.currentUser == null ? Signup() :
      Test(),
      routes: {
        
        "welcomepage" :(context) => Welcomepage(),
        "login" :(context) => Login(),
        "signup":(context) =>Signup(),
        "forgetpassword":(context) => ForgetPassword(),
        "resetpassword":(context) => ResetPassword(),
        "contactus":(context) =>Contact_us(),
         "ssignup":(context) => Ssignup(),
        "map" :(context) => Map(),
        "location" :(context) =>Location(),
        "voice":(context) =>Voice(),
        "patientinfo":(context) =>Profile_pati(),
        "test":(context) => Test(),
        "camera" :(context) => Camera(),
        "aboutapp":(context)=>About_App(),
        "info":(context) => Info(),
        "loginnn":(context) => Loginnn(),
        
        
       
        },
         
           

        );

      
     
        
  }
}
