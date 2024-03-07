import 'package:flutter/material.dart';

class CustomButtonAuth  extends StatelessWidget{
final void Function ()? onPressed;
final String title;

  const CustomButtonAuth({super.key, this.onPressed, required this.title});

 





  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
                  height: 60,
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  
                  onPressed: onPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                       Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
                      

                    ],
                 ));
    
  }

}