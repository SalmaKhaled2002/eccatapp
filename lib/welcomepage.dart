
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp( Welcomepage());
}
class Welcomepage extends StatefulWidget {
 

  @override
  State<Welcomepage> createState() => _MyHome();
}

class _MyHome extends State<Welcomepage> {
 
bool loading=false;

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
      
      body:
      Container(padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            const Text("  Thank You!",textAlign: TextAlign.center,
style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.orangeAccent),),
           
             Lottie.asset("assets/welcome.json",height: 320,width: 250),
             
             
          
            Text("        We thank you for your ",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
           const Text("              participation!",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
            const Text("     To save your review,you need to ",style: TextStyle(fontSize: 22,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
            const Text("                            login. ",style: TextStyle(fontSize: 22,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
            const Text("     Click next to login or create  an ",style: TextStyle(fontSize: 22,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
            const Text("                       account.   ",style: TextStyle(fontSize: 23,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
              
                    Container(
                      padding: EdgeInsets.only(top: 30,right: 30,left: 30,bottom: 20),
                     child: MaterialButton(
                      height: 90,minWidth: 200,
                          color: Colors.orangeAccent,
                          textColor: Colors.white,
                          shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(100),),
                          onPressed: ()async{
                             loading=false;
                     setState(() {
                       
                     });
                          await  Navigator.of(context).pushNamed("login");
                          loading=false;
                     setState(() {
                       
                     });
                     
                          },child:const  Text("Next",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45),)),
                   ),
                   
                  ] )))
     );
                 
            
      
        
      

    
    
     
        
  }
}
