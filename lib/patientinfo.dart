import 'package:flutter/material.dart';

import 'package:get/get.dart';



void main() {
  runApp( Profile_pati());
}
class Profile_pati extends StatefulWidget {
 

  @override
  State<Profile_pati> createState() => _MyHome_state();
}

class _MyHome_state extends State<Profile_pati> {
   TextEditingController username_pati =TextEditingController();
  TextEditingController age =TextEditingController();
  TextEditingController Diseases =TextEditingController();
  TextEditingController Medicine =TextEditingController();

  _MyHome(){
    _selectedval=diseases[3];
  }
  final diseases =["Pressure disease","Diabetes","Heart disease","Nothing"];
String _selectedval="";

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             // height:Get.height,
              child: Stack(
                children: [
                  greenIntroWidgtWithoutLogos(),
              Align(
                alignment:Alignment.bottomCenter,
                child: Container(
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.only(bottom:20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF674AEF),
                  ),
                      child: Center(child: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,)),
                ),
              )
                ],
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                TextFieldWidget('Name', Icons.person_outline, username_pati),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget('Age', Icons.calendar_month_outlined, age),
                const SizedBox(
                  height: 10,
                ),
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
                          
                      /*    border: UnderlineInputBorder(),
                           focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(90),
                                       borderSide: BorderSide(color: Colors.red)
                                     ),
                                      enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(45),
                                       borderSide: BorderSide(color: Colors.green,)
                                     ),
                                     disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blue,width: 2)),*/
                        
                        ),
                           ),
                   ),
                TextFieldWidget('Medicine', Icons.medication, age),
                const SizedBox(
                  height: 10,
                ),
                greenButton('Save',(){})
              ],
            ),
          )])
      ));
      
  
        
      
               
      
  }
  Widget greenIntroWidgtWithoutLogos(){
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/cam.jpg'),
          fit: BoxFit.fill,
        )
      ),
      height: Get.height*0.3,
      child: Container(
        height: Get.height*0.1,
        width: Get.width,
        margin: EdgeInsets.only(bottom: Get.height*0.05),
        child: Center(
          child: Text("Patient Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.white),),
        ),
      ),
    );
  }
  TextFieldWidget(String title,IconData iconData,TextEditingController controller){
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:Color(0xffA7A7A7)),),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 1
              )
            ],
            borderRadius: BorderRadius.circular(8)
            
          ),
          child: TextField(
            style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:Color(0xffA7A7A7)),
            decoration: InputDecoration(
              prefixIcon: Padding(padding: const EdgeInsets.only(left: 10),
              child: Icon(iconData,color: Color(0xFF674AEF),),)
            ),
          ),
        )
      ],
    );
  }
  Widget greenButton (String title,Function onPressed){
    return MaterialButton(
      minWidth: Get.width,
      height: 58,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      color: Color(0xFF674AEF),
      onPressed: ()=>onPressed(),
      child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
    );
  }
}