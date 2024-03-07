
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eccatapp/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( ForgetPassword());
}
class ForgetPassword extends StatefulWidget {
 

  @override
  State<ForgetPassword> createState() => _MyHome();
}

class _MyHome extends State<ForgetPassword> {
 TextEditingController email =TextEditingController();
bool loading=true;


  @override
  Widget build(BuildContext context) {
    return  Container(
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
    body: loading?Center(child: CircularProgressIndicator(),): Container(
      child:ListView(
        children:[
          Padding(padding:EdgeInsets.only(top: 15)),
       const Text("    Forget Password",
      style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.orangeAccent)),

        Container(
          padding: EdgeInsets.only(top: 10,right: 15,left: 15),
          child:ClipRRect(
            borderRadius: BorderRadius.circular(170),
            child:Image.asset("images/forget password.PNG",fit: BoxFit.cover,height: 350,)
          )),
        Padding(padding:EdgeInsets.only(top: 15)),
       const  Text("Don't worry sometimes people can forget too, enter your email and we will send you a password reset link. ",
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 196, 196, 196)),),
        Container(
          padding: EdgeInsets.only(top: 20,left: 35,right: 35),
          child:                
               CustomTextForm(labelText: "Email",hinttext: "Enter your email",mycontroller: email,obscuretext:false,validator: (val){
                  if (val == ""){
                    return("Can't to be empty!");
                  }},prefixIcon: Icon(Icons.email_outlined),),

        ) ,
                 InkWell(
                   onTap: ()async{
                    if (email.text == ""){
                       AwesomeDialog(
              btnOkIcon: Icons.ac_unit_outlined,
              btnCancelIcon:Icons.cancel_outlined ,
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.leftSlide,
            title: 'Error!',
            desc: 'Please write your email and then click on Sumbit '
            
            ).show();
                      return;
                    }
                   try{
                     loading=true;
                     setState(() {
                       
                     });
                     await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                   Navigator.of(context).pushNamedAndRemoveUntil("resetpassword", (route) => false);
                    loading=false;
                     setState(() {
                       
                     });
                   AwesomeDialog(
             
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.leftSlide,
            title: 'Alert',
            desc: 'A link to reset the password has been sent to your email.Please go to your email and click on the link.',
            btnCancelOnPress: () {
              print("Cancel Alert");
            },
            btnOkOnPress: () {
              print("Ok");
            },
            )..show();


                   }catch(e){
                    AwesomeDialog(
              
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.leftSlide,
            title: 'Error!',
            desc: 'Please make sure that the email you entered is correct and try again.',
            btnCancelOnPress: () {
              print("Cancel Alert");
            },
            btnOkOnPress: () {
              print("Ok");
            },
            )..show();


                   }
                  

                  },
                   child: Container(
                        padding:EdgeInsets.only(top:20,right:50,left: 50 ,bottom: 15),
                       child: MaterialButton(
                        height: 60,minWidth: 40,
                            color: Colors.orangeAccent,
                            textColor: Colors.white,
                            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(50),),
                            onPressed: ()async{
                              loading=true;
                     setState(() {
                       
                     });
                     loading=false;
                            },child:const  Text("Sumbit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
                            ),
                     ),
                 ),
                 
        ]
      )),
      
      
     ) );
  }
}