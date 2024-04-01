import 'package:flutter/material.dart';



void main() {
  runApp( Contact_us());
}
class Contact_us extends StatefulWidget {


  @override
  State<Contact_us> createState() => _MyHome();
}

class _MyHome extends State<Contact_us> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        ),
       // image: DecorationImage(
             //    fit:BoxFit.fill,
               // image: AssetImage('images/eccat.jpg'))
      ),
        child: ListView(
          children:[
        
        Container(
          padding: EdgeInsets.only(top:210,left: 10),
          alignment:Alignment.center ,
        
          child:Column(
            
            children: [
               Text("Email:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
               Text("eccat421@gmail.com",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
             
            ],
            
            
          ),
        
        
        ),
        Container(
          padding: EdgeInsets.only(top:20,left: 10),
          alignment:Alignment.center ,
        
          child:Column(
            
            children: [
               
               
               Text("Phone:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),
               Text("01070280250",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black)),
            ],
            
            
          ),
        
        
        ),
           
        
        ],
        
        ),
      ),
      

      );
  }
}