import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget{
  final String hinttext;
  final String labelText;

  
  final TextEditingController mycontroller;
  final bool obscuretext;
  final String ?Function (String?)? validator;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;

  const CustomTextForm( {super.key, required this.hinttext,this.keyboardType,this.readOnly,
   required this.mycontroller,required this.obscuretext, this.validator, this.icon,
   this.suffixIcon, this.prefixIcon,  required this.labelText   }) ;
   
  
    
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      validator:validator,
              controller: mycontroller,
              obscureText: obscuretext,
              
              decoration:  InputDecoration(
                labelText: labelText,
                labelStyle:TextStyle(fontWeight: FontWeight.w500,fontSize: 24,color:Colors.white  ),
                hintText:hinttext,
                icon:icon,
                prefixIcon:prefixIcon,
                suffixIcon:suffixIcon ,
                hintStyle:  TextStyle(fontSize:16,color: Colors.black),
                contentPadding:  EdgeInsets.all(20),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(90),
                  borderSide: BorderSide(color: Colors.red)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(90),
                  borderSide: BorderSide(color: Colors.green,width: 2)
                ),
                disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blue,width: 2)),

                
                
              ),
             );
  }

}