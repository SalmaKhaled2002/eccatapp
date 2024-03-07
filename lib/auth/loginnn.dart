import 'package:eccatapp/auth/signup.dart';
import 'package:eccatapp/components/custombuttonauth.dart';
import 'package:eccatapp/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp( Loginnn());
}
class Loginnn extends StatefulWidget {
 

  @override
  State<Loginnn> createState() => _MyHome();
  
}
class _MyHome extends State<Loginnn> {
  bool isPassword=true;
  final _emailController =TextEditingController();
    final _passwordController =TextEditingController();
    Future signup()async{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
   email:_emailController.text.trim(),
   password: _passwordController.text.trim(),
      );
        
      
    }
    @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                
            CustomButtonAuth(title:"login ", onPressed :(){
              Navigator.of(context).pushNamedAndRemoveUntil("test",(route) => false,);
            })
       ])
      )));
  }
  Widget togglePassword(){
  

  return IconButton(onPressed: (){
    setState(() {
       isPassword = !isPassword;
    });
    
  }, icon: isPassword ?Icon( Icons.visibility_off,color: Colors.deepPurple,):Icon(Icons.visibility,color: Colors.green,));}
} 