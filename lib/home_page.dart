
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eccatapp/patientinfo.dart';
import 'package:eccatapp/voice.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:eccatapp/userprof.dart';


class Test extends StatefulWidget {

  @override
  State<Test> createState() => _MyHome();
}

class _MyHome extends State<Test> {



  final user = FirebaseAuth.instance;
  
    String _web='';
  final websitrUri =Uri.parse("https://www.elwatannews.com/news/details/6742789#goog_rewarded");
  
  int selectedindex=0;
  bool isLoading = true;

  String? name;
  String? email;

@override
void initState()
{
  super.initState();
  setState(() {
    
  });
  getUserData();
}

  getUserData() async{
final user = FirebaseAuth.instance.currentUser; 
final uid = user!.uid   ;
   final DocumentSnapshot docUser = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      name = docUser.get('username');
    email = docUser.get('email');
    });
  }
  int _intpage=0;

//GlobalKey <CurvedNavigationBarState> _curvednavihationkey =GlobalKey();
List <Widget> screens=[
  Test(),
  Profile_pati(),
  Voice(),
];
  
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = 288.0;

    if (screenWidth > 480) {
      containerWidth = screenWidth / 2;
    }

    return Scaffold(
     
    /*  bottomNavigationBar: CurvedNavigationBar(
        color:Color(0xFF674AEF), 
        animationDuration: Duration(milliseconds: 300),
        key:_curvednavihationkey,
        index: 0,
        height: 65.0,
        items: 
      [
        Icon(Icons.home),
        Icon(Icons.person),
        Icon(Icons.settings),
      ],
      animationCurve: Curves.easeInOut,
      onTap: (index){
      setState(() {
        _intpage=index;
      });
      },
      letIndexChange: (index)=>true,
      ),*/
      
      
        bottomNavigationBar: BottomNavigationBar(
      onTap: (val){
        setState(() {
          selectedindex=val;
        });
      },
      currentIndex: selectedindex,
      iconSize: 24,
      showUnselectedLabels: true,
      selectedItemColor: Colors.black ,
      selectedFontSize: 23,
      unselectedFontSize: 18,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      
     type: BottomNavigationBarType.fixed,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Patient_info'),
       BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
      

    ],
    
    
    
    ),
    
     
    
    drawer:Drawer(
      backgroundColor:Colors.white,
      child: 
      Container(
        padding: EdgeInsets.only(top:20,left: 15),
          width: screenWidth > 480 ? containerWidth : 288,
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('uid' , isEqualTo: user.currentUser!.uid )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  
                  
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => const UserInfoPage(),
                             ),
                           );
                        },
                        child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  color:  const Color(0xFF17203A),
                                  size: 40,
                                ),
                              );
                            }
                            
                           
                            return CircleAvatar(
                              radius: 40,
                           
                              backgroundColor: Colors.grey,
                              child:
                             
                                  Icon(
                                      Icons.person,
                                      color:  Color.fromARGB(255, 33, 39, 59),
                                      size: 40,
                                    ),
                            );
                            
                          },
                          
                        ),
                        
                      ),
                      
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 150,
                        child: Column(
                          
                          children: [
                          
                             Text(name!,style: TextStyle(fontSize:24,fontWeight: FontWeight.bold,color: Color(0xFF674AEF),
                                                       ),overflow: TextOverflow.ellipsis),
                            
                              
                                Text(email!,style: TextStyle(fontSize:15,fontWeight: FontWeight.w600,color: Color(0xFF674AEF),
                                                             ),overflow: TextOverflow.ellipsis),
                               
                          ],
                        ),
                      ),
                     
                    ],
                  );
                },
              ),
      
     
        
           ListTile(
              title: Text("Homepage",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
              leading: Icon(Icons.home,size: 35,),
              onTap: (){ Navigator.of(context).pushNamed("test");},
            ),
          
           ListTile(
            title: Text("Patient_account",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
            leading: Icon(Icons.account_balance_rounded,size: 35,),
            onTap: (){
             Navigator.of(context).pushNamed("patientinfo");
            },
          ),
           ListTile(
            title: Text("Help ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
            leading: Icon(Icons.help,size: 35,),
            onTap: (){},
          ),
           ListTile(
            title: Text("About ECCAT",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
            leading: Icon(Icons.cloud_circle,size: 35,),
            
            onTap: ()async{
            launchUrl(
              websitrUri,
              mode: LaunchMode.externalApplication,
            );
            }
              
            
            
          ),
          
           ListTile(
            title: Text("About App",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
            leading: Icon(Icons.settings,size: 35,),
            onTap: (){
              Navigator.of(context).pushNamed("aboutapp");
            },
          ),
           ListTile(
            title: Text("Contact us",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
            leading: Icon(Icons.phone_android_outlined,size: 35,),
            onTap: (){
              Navigator.of(context).pushNamed("contactus");
            },
          ),
         
            ListTile(
              title: Text("Signout",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
              leading: Icon(Icons.exit_to_app,size: 35,),
              onTap: ()async{
               
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil("welcomepage", (route) => false);},
                       ),
          
          
          
          
        ]
        )
        ),
        
      ),



      

    ),
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
                    readOnly: true,
                    onTap: () {
                                showSearch(context: context, delegate: CustomSearch());

                    },
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
                 
                

      
      GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        childAspectRatio:(MediaQuery.of(context).size.height -50-25) /(4*240),
        mainAxisSpacing:10,
        crossAxisSpacing:10,
        ),
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("location");
            },
             child:Card(
            child: Container(
              padding:EdgeInsets.only(bottom: 1),
                    
                   
                          decoration: BoxDecoration(
                            color:Color(0xFFF5F3FF),
                            borderRadius: BorderRadius.circular(30)
                          ), 
              child: Column(
                children: [
                  Image.asset("images/Location.png",height: 180,scale:0.3),
                 
                                Text("Location",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),),
                            ]
                  )
                  )
           ),
          ),
            Card(
              child: Container(
                padding:EdgeInsets.only(bottom: 1),
                      
                     
                            decoration: BoxDecoration(
                              color:Color(0xFFF5F3FF),
                              borderRadius: BorderRadius.circular(30)
                            ), 
                child: Column(
                  children: [
                    Image.asset("images/AI.png",height: 180,scale:0.3),
                   
                                  Text("Ai",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.6)),),
                              ]
                    )
                    )
             ),
        ])])),
             ]) );
        
            
            
    
                
  }
}


class CustomSearch extends SearchDelegate{
  List username=[
     "Battery",
     "Healt_hcare",
     "Iot",
     "Patient_profile",
     "User_profile",
     "Map",
     "Location",
     "Voice",
     "Face_recogotion",
     "Camera",
     "Settings"

  ];
  List ?filterList ;
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [IconButton(onPressed: (){
    query="";
   }, icon: Icon(Icons.arrow_back))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context,null);
    }, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    // return Text("Result $query");
    List<String> matchQuey = [];
    for (var screen in username){if (screen.toLowerCase().contains(query.toLowerCase())){matchQuey.add(screen);}}
    return ListView.builder(itemBuilder:(context, index) {
      var result = matchQuey[index];
      return ListTile(onTap: (){_navigateToScreen(context, result);},title: Text(result),);
    }, itemCount: matchQuey.length,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

List<String> matchQuey = [];
    for (var screen in username){if (screen.toLowerCase().contains(query.toLowerCase())){matchQuey.add(screen);}}
    return ListView.builder(itemBuilder:(context, index) {
      var result = matchQuey[index];
      return ListTile(onTap: (){_navigateToScreen(context, result);},title: Text(result),);
    }, itemCount: matchQuey.length,);


 
  } 

  void _navigateToScreen(BuildContext context, String screenName) {
  switch (screenName) {
    case "Map":
       Navigator.of(context).pushNamed("map");
      
      break;
    case "Location":
       Navigator.of(context).pushNamed("location");
      break;
       case "Voice":
      Navigator.of(context).pushNamed("voice");
      break;
    default:
      break;
  }
}
    
    }



