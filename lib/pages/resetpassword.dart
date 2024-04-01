
import 'package:flutter/material.dart';

void main() {
  runApp( ResetPassword());
}
class ResetPassword extends StatefulWidget {
 

  @override
  State<ResetPassword> createState() => _MyHome();
}

class _MyHome extends State<ResetPassword> {
 


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin:Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ]
        )
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,  
    body: Container(
      child:ListView(
        children:[
          const Text(" Password Reset Email Sent",textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.orangeAccent)),
        Container(
          padding: EdgeInsets.only(top: 10,right: 15,left: 15),
          child:ClipRRect(
            borderRadius: BorderRadius.circular(170),
            child:Image.asset("images/sign in.PNG",fit: BoxFit.cover,height: 350,)
          )),
        
        const Text("Your Account Security is our priority!"),
        const Text ("we've sent you a secure link to Safety Change your Password and Keep your Account Protected"),
        InkWell(
          onTap: ()async{
           await Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
          },
          child: Container(
                        padding: EdgeInsets.only(bottom: 10,right: 30,left: 30),
                       child: MaterialButton(
                        height: 70,minWidth: 200,
                            color: Colors.blue,
                            textColor: Colors.white,
                            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(100),),
                            onPressed: (){
                              
                            },child:const  Text("Done ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)),
                     ),
        ),
        ]
      )
    )
    ));
  }
}