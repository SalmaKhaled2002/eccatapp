import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccatapp/auth/signup.dart';
import 'package:eccatapp/components/custombuttonauth.dart';
import 'package:eccatapp/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp( Ssignup());
}
class Ssignup extends StatefulWidget {
 

  @override
  State<Ssignup> createState() => _MyHome();
  
}
class _MyHome extends State<Ssignup> {
  bool isPassword=true;
   final _emailController =TextEditingController();
    final _passwordController =TextEditingController();
       final agecontroller =TextEditingController();
final _confirmpasswordController=TextEditingController();
   final phonecontroller =TextEditingController();

   final usernamepatient =TextEditingController();
 @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    agecontroller.dispose();
    phonecontroller.dispose();
    usernamepatient.dispose();
    super.dispose();
  }
    Future signup()async{
     if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(),
       password: _passwordController.text.trim(),
       );
       addUserDetails(
        user_name.text.trim(),
        _emailController.text.trim(),
         int .parse(phonecontroller.text.trim()) ,
           usernamepatient.text.trim(),
        int .parse(agecontroller.text.trim()) ,
      
      
        
     );
     }
        
      
    }
    Future addUserDetails(String username,String email,
    int phone,String username_patient,int age)async{
      await FirebaseFirestore.instance.collection('users').add({
        'username':username,
        'email':email,
        'phone':phone,
        'username_patient':username_patient,
        'age':age,
      });
    }
    bool passwordConfirmed(){
      if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){
        return true;
      }else{
        return false;
      }
      
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
      body:Container(padding: const EdgeInsets.only(right: 35,left: 35),
       child: ListView(
          children: [
            Text("        SignUp",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:Colors.orangeAccent)),
            //const Padding(padding:EdgeInsets.all(3) ),
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Lottie.asset("assets/wel.json",height: 200,width: 300,)),
            
             Container(
              padding: EdgeInsets.only(top:10),
               child: CustomTextForm(labelText: "User_name",hinttext: "Enter your username",mycontroller: user_name,obscuretext:false,validator: (val){
                    if (val == ""){
                      return("Can't to be empty!");
                    }},prefixIcon: Icon(Icons.person,color: Colors.deepPurple,)),
             ),
             Container(height: 10,),
             
             CustomTextForm(labelText: "Email",hinttext: "Enter your email",mycontroller: useremail,obscuretext:false,validator: (val){
                  if (val == ""){
                    print("Can't to be empty!");
                  }},prefixIcon: Icon(Icons.email_outlined,color: Colors.deepPurple,)),

             
             Container(height: 10,),
             CustomTextForm(labelText: "Password",hinttext: "Enter your password",mycontroller: userpassword,obscuretext:isPassword,validator: (val){
                  if (val == ""){
                    return("Can't to be empty!");
                  }},prefixIcon: Icon(Icons.lock,color: Colors.deepPurple,),suffixIcon: togglePassword()),
                
             Container(height: 10,),
             CustomTextForm(labelText: "Phone_Number",hinttext: "Enter your number",obscuretext:false,mycontroller: userPhone_Number,validator: (val){
                  if (val == ""){
                    return("Can't to be empty!");
                  }},prefixIcon: Icon(Icons.phone,color: Colors.deepPurple,)),
                  
                  const Text("  Patient_information",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.orangeAccent),),
                  
                  Container(height: 10,),
            CustomTextForm(labelText: "User_name",hinttext: "Enter his patient_name ",mycontroller: username_patient,obscuretext:false,validator: (val){
                  if (val == ""){
                    return("Can't to be empty!");
                  }},prefixIcon: Icon(Icons.person,color: Colors.deepPurple,)),
                   //const Text("Age",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white  ),),
                   Container(height: 10,),
            CustomTextForm(labelText: "Age",hinttext: "Enter his age",mycontroller: age_patient,obscuretext:false,validator: (val){
                  if (val == ""){
                    return("Can't to be empty!");
                  }},prefixIcon: Icon(Icons.calendar_month,color: Colors.deepPurple,)),
                    CustomButtonAuth(title:"  Create Account  ", 
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed("test");
                              }
       )])
      )));
  }
  Widget togglePassword(){
  

  return IconButton(onPressed: (){
    setState(() {
       isPassword = !isPassword;
    });
    
  }, icon: isPassword ?Icon( Icons.visibility_off,color: Colors.deepPurple,):Icon(Icons.visibility,color: Colors.green,));}
} 