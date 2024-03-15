
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp( Camera());
}
class Camera extends StatefulWidget {
 

  @override
  State<Camera> createState() => _MyHome();
}

class _MyHome extends State<Camera> {

   File? file;

   getImage()async {
    final ImagePicker picker = ImagePicker();

final XFile? imagecamera = await picker.pickImage(source: ImageSource.camera);
file =File(imagecamera!.path);
setState(() {
  
});
   }



  @override
  Widget build(BuildContext context) {
    return  Container(
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
        padding: EdgeInsets.only(top:190,right: 30,left: 35),

        child: Column(
          children: [
            MaterialButton(
               height: 60,
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  
              onPressed: ()async{
               await getImage();
            },child: Text("Get image Camera",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
            
            ),
            if (file!=null) Image.file(file!,width: 250,height: 300,fit: BoxFit.cover,)
          ],
        ),
      ))
    );
  }
}