

//import 'package:awesome_dialog/awesome_dialog.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccatapp/components/custombuttonauth.dart';
import 'package:eccatapp/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp( Login());
}
class Login extends StatefulWidget {
 

  @override
  State<Login> createState() => _MyHome();
}

class _MyHome extends State<Login> {
TextEditingController email =TextEditingController();
TextEditingController password =TextEditingController();

final firestore = FirebaseFirestore.instance;
bool isPassword=true;
GlobalKey<FormState> formState =GlobalKey<FormState>();
bool loading=false;

Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if (googleUser ==null){
    return;
  }
  final GoogleSignInAuthentication? googleAuth = 
  await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
   await FirebaseAuth.instance.signInWithCredential(credential);
  Navigator.of(context).pushNamedAndRemoveUntil("test", (route) => false);
}

  @override
  Widget build(BuildContext context) {
    return Container(
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
      body:loading?Center(child: CircularProgressIndicator(),):
       Container(padding: const EdgeInsets.only(right: 35,left: 35),
        child: ListView(
          
          children: [
            Text("         Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.orangeAccent)),
            Form(
             key:formState ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Lottie.asset("assets/wel.json",height: 250,width: 300)),
               
               
               Container(
                padding: EdgeInsets.only(top:20,bottom:10),
                 child: CustomTextForm(labelText: "Email",hinttext: "Enter your email",mycontroller: email,obscuretext:false,validator: (val){
                    if (val == ""){
                      return("Can't to be empty!");
                    }},prefixIcon: Icon(Icons.email_outlined,color: Colors.deepPurple,)),
               ),
                  
             
            
                Container(
                  padding: EdgeInsets.only(top:10,bottom:10),
                  child: CustomTextForm(hinttext: "Enter your password",labelText: "Password",mycontroller: password,
                  obscuretext:isPassword,validator: (val){
                    if (val == ""){
                      return ("Can't to be empty!");
                    }
                  },prefixIcon: Icon(Icons.lock,color: Colors.deepPurple,),suffixIcon: togglePassword()),
                ),
                  
                 InkWell(
                  onTap: ()async{
                    await Navigator.of(context).pushNamedAndRemoveUntil("forgetpassword", (route) => false);
                    loading=false;
                    setState(() {
                      
                    });

                  },
                   child: Container( margin: const EdgeInsets.only(top: 10,bottom: 20),alignment:Alignment.topRight ,
                   child: const Text("Forget my password?!",
                   style: TextStyle(color: Colors.orangeAccent,fontSize: 17),)),
                 ),
                 Container(padding: const EdgeInsets.only(left: 35,right: 35),
                   
                    
                 ),
              
                 CustomButtonAuth(title:"login ", onPressed :()async{
               if (formState.currentState!.validate() ) {
                    try {
                      loading=true;
                      setState(() {
                        
                      });
                      
                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email.text,
                  password: password.text,
                );
                
                
                
                loading=false;
                      setState(() {
                        
                      });
                Navigator.of(context).pushNamedAndRemoveUntil("test",(route) => false,);
                loading=false;
                      setState(() {});
              } on FirebaseAuthException catch (e) {
                loading=false;
                      setState(() {});
                if (e.code == 'user-not-found') {
                  //print('No user found for that email.');
                 AwesomeDialog(
              btnOkIcon: Icons.ac_unit_outlined,
              btnCancelIcon:Icons.cancel_outlined ,
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.leftSlide,
            title: 'Error!',
            desc: 'No user found for that email.',
            btnCancelOnPress: () {
              print("Cancel Alert");
            },
            btnOkOnPress: () {
              print("Ok");
            },
            )..show();
              
                } else if (e.code == 'wrong-password') {
                  //print('Wrong password provided for that user.');
                 AwesomeDialog(
              btnOkIcon: Icons.ac_unit_outlined,
              btnCancelIcon:Icons.cancel_outlined ,
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.leftSlide,
            title: 'Error!',
            desc: 'Wrong password provided for that user.',
            btnCancelOnPress: () {
              print("Cancel Alert");
            },
            btnOkOnPress: () {
              print("Ok");
            },
            )..show();
             
                }
              }
                  }
                 } 
                 
                 ),
                 Container(
                  padding: EdgeInsets.only(top: 10),
                   child: MaterialButton(
                        height: 60,
                        color: Color.fromARGB(255, 79, 165, 136),
                        textColor: Colors.white,
                        minWidth: 40,
                        
                        
                    
                    onPressed: ()async{
                   await signInWithGoogle();
                     loading=true;
                     setState(() {
                       
                     });
                     loading=false;
                    }
                    ,child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Image.asset("images/google.PNG",width: 50),
                        const Text("Sign With Google",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        
                   
                      ],
                   )),
                 ),
                  
                    
                    
                     
              
                 Container(padding: EdgeInsets.only(top:15),),
                 InkWell(
                  onTap: (){
                    Navigator.of(context) .pushReplacementNamed("signup");
              
                  }, 
                  child:const Center(
                    child: Text.rich(TextSpan(children: [
                      
                      TextSpan(text: "Don't have an account?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      TextSpan(text: "Sign up!",style: TextStyle(color:Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 20))
                    ])),
                  )
              ),
              
              ]
              ),
            ),
                
                ],
               
               
         
        
        
        ),
      ),
      
    ));
  }

Widget togglePassword(){
  

  return IconButton(onPressed: (){
    setState(() {
      isPassword = !isPassword;
    });
    
  }, icon: isPassword ?Icon( Icons.visibility_off,color: Colors.deepPurple,):Icon(Icons.visibility,color: Colors.green,),);
}
}