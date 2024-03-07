import 'dart:typed_data';

import 'package:eccatapp/photo.dart';
import 'package:eccatapp/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp( Teeest());
}
class Teeest extends StatefulWidget {
 

  @override
  State<Teeest> createState() => _MyHome();
}
final databaseReference = FirebaseDatabase.instance.ref("StoreData");

class _MyHome extends State<Teeest> {

  Uint8List ?_image;
  void selectedImage()async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image=img;
    });
  }
    String _web='';
  final websitrUri =Uri.parse("https://www.elwatannews.com/news/details/6742789#goog_rewarded");
  
  int selectedindex=0;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         bottomNavigationBar: BottomNavigationBar(
      onTap: (val){
        setState(() {
          selectedindex=val;
        });
      },
      currentIndex: selectedindex,
      iconSize: 24,
      showUnselectedLabels: true,
      selectedItemColor: Color(0xFF674AEF),
      selectedFontSize: 20,
      unselectedFontSize: 14,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
     
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
       BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Patient_info'),

    ]),
    
     
    
    drawer:Drawer(
      backgroundColor:Colors.white,
      child: Container(
        padding: EdgeInsets.only(top:18,right:15,left:15 ),
        child:ListView(children: [
          Row(
            children: [
              Stack(
          children: [
            _image !=null ? CircleAvatar(
              radius: 64,
              backgroundImage: MemoryImage(_image!),
            ):
            CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage('images/photo.jpg'),
            ),
             Positioned(child: IconButton(onPressed: (){}, icon: const Icon(Icons.add_a_photo),
            
            ),
            bottom: -10,
            left: 80,
            )
          ],
        ),
       // child:ClipRRect(borderRadius: BorderRadius.circular(60),
        //child: Image.asset("images/icon.jpg",fit: BoxFit.cover,)),
      
      Expanded(child:  FirebaseAnimatedList 
      (
        query :databaseReference ,
        itemBuilder :(context ,snapshot ,animation ,index){
        return ListTile(
          title: Text(snapshot.child('username').value .toString()),
          subtitle: Text(snapshot.child('email').value .toString()), 
        );
      }))
            ]
          ), 
          ListTile(
              title: Text("Signout",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
              leading: Icon(Icons.exit_to_app,size: 35,),
              onTap: ()async{
               
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil("welcomepage", (route) => false);},
                       ),
          
          
            
          
        ])),
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){
          showSearch(context: context, delegate: CustomSearch());
           bool isLoading = true;
           setState(() {
             
           });
        }),
      body: 
      //isLoading == true ? Center (child:Text("Loading.....")):
      ListView(
        
        children: [
          Container(
            padding: EdgeInsets.only(top:15,left:15,right:15,bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xFF674AEF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    
                    Builder(builder: (context)=>IconButton(onPressed: (){
        Scaffold.of(context).openDrawer();
      }, icon: Icon(Icons.dashboard,size: 30,color: Colors.white,))),
                   
                       Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                    
                  ],
                ),
                SizedBox(height: 20,),
                Padding(padding: EdgeInsets.only(left: 3,bottom: 15),
                child: Text(
                  "Hi,Dear",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                
                
                ),
                Container(
                  
                  margin:EdgeInsets.only(top: 5,bottom: 20) ,
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40)),
                  
                  
                 child: TextFormField(
                    decoration: InputDecoration(
                      
                      border: InputBorder.none,
                      hintText: "Search here...",
                      hintStyle: TextStyle(
                        color: Colors.blue.withOpacity(0.5),
                      ),
                      
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20,left:15,right:15),
          child:Column(
            children: [
      
      
       GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                 gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1.1),
                 children: [
          
             InkWell(
              onTap: (){
              Navigator.of(context).pushNamed("map");
            },
               child: Column(
                children: [
                 Container(height: 60,
                          width: 60,
                            decoration: BoxDecoration(
                              color:Color(0xFFFFCF2F),
                              shape: BoxShape.circle
                            ), 
                            child: Center(
                              child: Icon(Icons.explore,size: 40,color:Colors.white),)
                           
                            ),
                         
                          SizedBox(height: 10,),
                         Text("Map",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),),
                   ]
                   ),
             ),

                  InkWell(
                    onTap: (){
              Navigator.of(context).pushNamed("voice");
            },
             child: Column(
                                  children: [
                                   Container(height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color:Color(0xFF6FE08D),
                              shape: BoxShape.circle
                            ), 
                            child: Center(
                              child: Icon(Icons.mic,size: 40,color:Colors.white),)
                           
                            ),
                         
                          SizedBox(height: 10,),
                         Text("Voice",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),),
                                  ]
                            ),
                  ),


                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("camera");
                    },
                    child: Column(
                                  children: [
                                   Container(height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color:Color(0xFF618DFD),
                            shape: BoxShape.circle
                          ), 
                          child: Center(
                            child: Icon(Icons.add_a_photo,size: 40,color:Colors.white),)
                    
                          ),
                          SizedBox(height: 10,),
                         Text("Camera",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),),
                                     ]
                                     ),
                  ),



                  Column(
              children: [
               Container(height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color:Color(0xfffc7f7f),
                          shape: BoxShape.circle
                        ), 
                        child: Center(
                          child: Icon(Icons.battery_charging_full,size: 40,color:Colors.white),)

                        ),
                        SizedBox(height: 10,),
                       Text("Battery",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6)),),
                 ]
                 ),



                  Column(
              children: [
              Container(height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color:Color(0xFFCB84FB),
                          shape: BoxShape.circle
                        ), 
                        child: Center(
                          child: Icon(Icons.health_and_safety,size: 40,color:Colors.white),)

                        ),
                        SizedBox(height: 10,),
                       Text("HealthCare",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6)),),
              ],
                  )
                 ]),
                
                
                 Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Features",
                  style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),),
                  Text("See All",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Color(0xFF674AEF)
                  ),
                  )
                  ],
                 ),
                 
                
    
                 
          ]))]));
      
          
          
        
     
  }
}