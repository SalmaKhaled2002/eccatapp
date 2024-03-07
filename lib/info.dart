import 'dart:typed_data';

import 'package:eccatapp/auth/signup.dart';
import 'package:eccatapp/photo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp( Info());
}
class Info extends StatefulWidget {
 

  @override
  State<Info> createState() => _MyHome_state();
}

class _MyHome_state extends State<Info> {
  final databaseReference = FirebaseDatabase.instance.ref("StoreData");
 Uint8List ?_image;
  void selectedImage()async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image=img;
    });
  }
   @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             // height:Get.height,
              child: Stack(
                children: [
                  greenIntroWidgtWithoutLogos(),
              Align(
                alignment:Alignment.bottomCenter,
                child: Container(
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.only(bottom:20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF674AEF),
                  ),
                      child: Center(child: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,)),
                ),
              )
                ],
              ),
            ),
          const SizedBox(
            height: 20,
          ),
     
          ])
     ));
              
           
      }

  Widget greenIntroWidgtWithoutLogos(){
    return Container(
     
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/cam.jpg'),
          fit: BoxFit.fill,
        )
      ),
      
      child: Container(
        
       
        child: Center(
          child: Text("Patient Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.white),),
        ),
      ),
    );
  }
}