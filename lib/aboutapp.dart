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
      
      ),
        child: ListView(
          padding: EdgeInsets.only(top: 160,right: 2,left: 2),
          
          children: [
            InkWell(
              onTap: (){
                showDialog(context: context, 
                  builder: (context){
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        title: Text("Warning"),
                        content: Text("Are you Sure !"),
                        actions: 
                        [TextButton(
                          onPressed: (){
                          Navigator.of(context).pushNamed("test");
                        },
                         child: Text("Ok")),
                          
                          TextButton(
                            onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Cancel"))],
                        
                      );
                         
                    });
                  
              },
              child: Center(
                
                child: 
                Text("This App managed the Wheel_Chair that allow you to keep track of everything in smart Wheel_Chair.",
                style: TextStyle(fontSize: 26 ,fontWeight: FontWeight.w700,color: Colors.black),),
                
              ),
            ),
            Container(
              padding:EdgeInsets.only(top: 50),
              child: Image.asset('images/eccat.jpg',fit: BoxFit.fill,height: 400,)),
           
          ],
            
          
        
            ),
      ));
        
          
          
      
      
    
  }
}