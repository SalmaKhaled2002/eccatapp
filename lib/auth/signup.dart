

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:eccatapp/components/custombuttonauth.dart';
import 'package:eccatapp/components/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

void main() {
  runApp( Signup());
}
class Signup extends StatefulWidget {
 

  @override
  State<Signup> createState() => _MyHome();
  
}

  TextEditingController user_name =TextEditingController();
  TextEditingController useremail =TextEditingController();
  TextEditingController userpassword =TextEditingController();
  TextEditingController userPhone_Number =TextEditingController();
  TextEditingController username_patient =TextEditingController();
  TextEditingController age_patient =TextEditingController();
  TextEditingController Disease_patient =TextEditingController();
  TextEditingController Medicine_patient =TextEditingController();
//final databaseReference = FirebaseDatabase.instance.ref("StoreData");
class _MyHome extends State<Signup> {
   
  bool status = false;
  
  

   CollectionReference users = FirebaseFirestore.instance.collection('users');

    

   
    



  final  firestore = FirebaseFirestore.instance;
  bool isPassword=true;
  _MyHome(){
    _selectedval=diseases[3];
  }
  Future<void> createUserDocument(UserCredential?userCredential)async
{
  if(userCredential !=null && userCredential.user !=null){
    await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.email).set({
      'email':userCredential.user!.email,
      'username':user_name.text,
      'Phone_Number':userPhone_Number.value,
      'username_pati':username_patient.text,
      'age':age_patient.value,
      'Medicine':Medicine_patient.text,

    });
  }
}
bool loading=false;
final diseases =["Pressure disease","Diabetes","Heart disease","Nothing"];
String _selectedval="";

 /*CollectionReference categories_users = FirebaseFirestore.instance.collection('categories users');
  Future<void> addUser(){
    return categories_users.add({
      "name":user_name.text.toString(),
    })
    .then((value) => print("User added")).catchError((error) =>print ("Failed to add user:$error"));
  }*/

  String? email;
  String? password;
  String? Name;
  String? phone;
  String? usernemrpatient;
  String? agepatient;
  String? dieasespatient;
  String? medicinepatient;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                   





                   Container(height: 10,),
            CustomTextForm(labelText: "Age",hinttext: "Enter his age",mycontroller: age_patient,obscuretext:false,validator: (val){
                  if (val == ""){
                    return("Can't to be empty!");
                  }},prefixIcon: Icon(Icons.calendar_month,color: Colors.deepPurple,)),
                   
                   Container(
                    padding: EdgeInsets.only(top:20,bottom:5),
                     child: DropdownButtonFormField(
                       
                      value: _selectedval,
                      items: diseases.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                       onChanged: (val){
                        setState(() {
                          _selectedval=val as String;
                        },);},
                        icon:const Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.deepPurple,
                        ),
                        dropdownColor: Colors.deepPurple.shade50,
                        decoration: InputDecoration(
                          hintText: "Diseases",
                          hintStyle:  TextStyle(fontSize:16,color: Colors.black),
                          labelText: "Diseases",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color:Colors.white  ),
                          prefixIcon: Icon(
                            Icons.medical_information,
                          color: Colors.deepPurple,),
                          
                          border: UnderlineInputBorder(),
                           focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(90),
                                       borderSide: BorderSide(color: Colors.red)
                                     ),
                                      enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(45),
                                       borderSide: BorderSide(color: Colors.green,)
                                     ),
                                     disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blue,width: 2)),
                        
                        ),
                           ),
                   ),
       
             Container(height: 10,),
             CustomTextForm( labelText: "Medicine",hinttext: "Write the medicine his use",mycontroller: Medicine_patient,obscuretext:false,validator: (val){
                  if (val == ""){
                    return("Can't to be empty!");
                  }},prefixIcon: Icon(Icons.medication,color: Colors.deepPurple,)),
            

          
            
                 Container(
                  padding: EdgeInsets.only(top:10,left: 20),
                   child: Column(
                    
                               children: [
                                
                                 CheckboxListTile(value: status,activeColor: Colors.green,checkColor: Colors.black,
                                 controlAffinity: ListTileControlAffinity.leading,
                                 title: const Text("I agree to privacy policy and Terms of use.",
                                 style: TextStyle(fontSize: 15,color:  Colors.white)),
                                 
                                  onChanged: (val){
                                   setState(() {
                    status=val!;
                                   });
                                 }),
                                 Container(
                        padding: EdgeInsets.only(bottom: 10,right: 30,left: 30),),
                         
                             
                       CustomButtonAuth(title:"  Create Account  ", 
                              onPressed: () async{
                                
                          try {
                            loading=true;
                            setState(() { });
                        UserCredential ?userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            
                              email: useremail.text,
                                password: userpassword.text,
                             );

                             
                          /*    Future addUserDetails(String username,String email,
    int phone,String username_patient,int age)async{
      await FirebaseFirestore.instance.collection('users').add({
        'username':username,
        'email':email,
        'phone':phone,
        'username_patient':username_patient,
        'age':age,
      });
    }*/
                            /* onSubmitted:(data){
                              users.add({
                                'username':data,
                                'email':data,
                                'phone':data,
                                'usernamepatient':username_patient.text,
                                'age':data,
                                'diease':data,
                                'medicine':data,
                              });
                              user_name.clear();
                              useremail.clear();
                              userPhone_Number.clear();
                              username_patient.clear();
                              age_patient.clear();
                              Disease_patient.clear();
                              Medicine_patient.clear();
                             };*/
                           /*  if(username.text.isEmpty ||
                             email.text.isEmpty ||
                             password.text.isEmpty ||
                             username_pati.text.isEmpty ||
                             Phone_Number.text.isEmpty ||
                             age.text.isEmpty ||
                             Medicine.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter all fields"),
                              duration:Duration(seconds: 2) ,));
                              return;
                             }
                             databaseReference.child(DateTime.now().microsecond.toString()).child("Details")
                             .set({
                              'username':username.text..toString(),
                              'id':DateTime.now().microsecond.toString(),
                              'email':email.text.toString(),
                              'password':password.text.toString(),
                              'Phone_number':Phone_Number.text.toString(),
                              'username patient':username_pati.text.toString(),
                              'age':age.text.toString(),
                              'Medicine':Medicine.text.toString(),
                              'Diseases':Diseases.text.toString(),
                             });
                             username.clear();
                             email.clear();
                             password.clear();
                             Phone_Number.clear();
                             username_pati.clear();
                             age.clear();
                             Medicine.clear();
                             Diseases.clear();
                             FocusScope.of(context).unfocus();

*/
                          
                             loading=false;
                             setState(() {});
                             
                             Navigator.of(context).pushReplacementNamed("test");
                         } 
                         on FirebaseAuthException catch (e) {
                               if (e.code == 'weak-password') {
                               print('The password provided is too weak.');
                                AwesomeDialog(
                                            context:context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.leftSlide,
                                            showCloseIcon: true,
                                            title: "Error!",
                                            desc:"The password provided is too weak.",
                                            btnCancelOnPress: (){},
                                            btnOkOnPress: (){},
                        
                                          ).show();
                              } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                           AwesomeDialog(
                                            context:context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.leftSlide,
                                            showCloseIcon: true,
                                            title: "Error!",
                                            desc:"The account already exists for that email.",
                                            btnCancelOnPress: (){},
                                            btnOkOnPress: (){},
                        
                                          ).show();
                                }
                        } catch (e) {
                             print(e);
                                }
                                
                              }),
                      
           ] ),
          
                              
                  ),
          
          ],
        ) 
    )));
    
     
}
Widget togglePassword(){
  

  return IconButton(onPressed: (){
    setState(() {
      isPassword = !isPassword;
    });
    
  }, icon: isPassword ?Icon( Icons.visibility_off,color: Colors.deepPurple,):Icon(Icons.visibility,color: Colors.green,));}



}