import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eccatapp/photo.dart';

import 'dart:typed_data';
void main() {
  runApp( Myprofile());
}
class Myprofile extends StatefulWidget {
 

  @override
  State<Myprofile> createState() => _MyHome_state();
}
final databaseReference = FirebaseDatabase.instance.ref("StoreData");
class _MyHome_state extends State<Myprofile> {
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
      body:
              Center(
                
                child:Column(
                  
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:[
            /* Stack(
              children: [
                _image !=null ? CircleAvatar(
                  radius: 64,
                  backgroundImage: MemoryImage(_image!),
                ):
                CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage('images/photo.jpg'),
                ),
                Positioned(child: IconButton(onPressed: (){
                  selectedImage();
                }, icon: const Icon(Icons.add_a_photo),
                
                ),
                bottom: -10,
                left: 80,
                ),
                
              ],
            ),
                  ]
                  )
                ) 
          
          
          );*/
              
             Expanded(child:  FirebaseAnimatedList 
      (
        query :databaseReference ,
        itemBuilder :(context ,snapshot ,animation ,index){
        return Card(
          child: ListTile(
            title: Text(snapshot.child('username_pati').value .toString()),
          
           
          ),
          
        );
    /*  return Card(
          child: ListTile(
            title: Text(snapshot.child('age').value .toString()),
          
           
          ),
          
        );
        return Card(
          child: ListTile(
            title: Text(snapshot.child('Diseases').value .toString()),
          
           
          ),
          
        );
        return Card(
          child: ListTile(
            title: Text(snapshot.child('Medicine').value .toString()),
          
           
          ),
          
        );*/
  
  })
  )
 ])) );
               
    
  }
}