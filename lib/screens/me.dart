
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
   final websitrUri = Uri.parse(
      "https://www.elwatannews.com/news/details/6742789#goog_rewarded");
  final user = FirebaseAuth.instance;
  int selectedindex = 0;
  String? username;
  String? email;
  String? role;
  String? uid;
  int? phone;
  String? gender;
  String? username_patient;
  int? age;
  String? diseases;
  String? medicine;

  // @override
  // void initState() {
  //   super.initState();
  //   getUserData();
  // }

  // getUserData() async {
  //   uid = user.currentUser!.uid;
  //   final DocumentSnapshot docUser =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   if (docUser.exists) {
  //     setState(() {
  //       uid = docUser.get('uid');
  //       username = docUser.get('username');
  //       email = docUser.get('email');
  //       phone = docUser.get('phone');
  //       gender = docUser.get('gender');
  //       role = docUser.get('role');
  //       username_patient = docUser.get('username_patient');
  //       age = docUser.get('age');
  //       diseases = docUser.get('Diseases');
  //       medicine = docUser.get('Medicine');
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
        var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return ListView(
    children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:6,right: 6,bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text('Me',
                     style: TextStyle(fontSize: 30,fontWeight:FontWeight.w500),
                     textAlign: TextAlign.start,
                     overflow: TextOverflow.ellipsis,),
                      Icon(Icons.chat,
                                    size: 30, color: Colors.black),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:6,right: 6),
            child: Card(
            color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // StreamBuilder(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('users')
                  //       .where('uid', isEqualTo: user.currentUser!.uid)
                  //       .snapshots(),
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return CircularProgressIndicator();
                  //     }
                  //     return 
                  Row(
                        children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 33, 39, 59),
                                  size: 40,
                                ),
                                                           ),
                             ),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          // Container(
                          //   width: 150,
                          //   child: Column(
                          //     children: [
                          //       Text(
                          //         username ?? 'No Name',
                          //         style: TextStyle(
                          //             fontSize: 24,
                          //             fontWeight: FontWeight.bold,
                          //             color: Color(0xFF674AEF)),
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //       Text(
                          //         email ?? 'No Email',
                          //         style: TextStyle(
                          //             fontSize: 15,
                          //             fontWeight: FontWeight.w600,
                          //             color: Color(0xFF674AEF)),
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                  )
                ]))),
         ]),
          Padding(
            padding: const EdgeInsets.only(left: 6,right: 6),
            child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing:3.0,
                        mainAxisSpacing: 3.0, 
                        mainAxisExtent: 100,
                      ),
                      children: [
                       InkWell(
                        onTap: () {
                    Navigator.of(context).pushNamed("camera");
                  },
                         child: Card(
                          child: FittedBox(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 850,top: 50),
                                      child: Icon(Icons.camera_alt_outlined,
                                    size: 750,color: Colors.blue,),
                                      // Image.asset("images/cam.PNG",
                                      // height: 900,width: 1200,scale: 0.2,fit: BoxFit.fill),
                                    ),
                                       Positioned(
                                    left:90,
                                    top:55 ,
                                child:   Column(
                                    children: [
                                       Text(
                                  "Camera ",
                                  style: TextStyle(
                                      fontSize: 150,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                
                                    ],
                                   )
                              ),
                                 Positioned(
                                    left:90,
                                    top:230 ,
                                child:   Column(
                                    children: [
                                Text(
                                  "See ",
                                  style: TextStyle(
                                      fontSize: 100,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                                
                                    ],
                                   )
                              ),
                                Positioned(
                                    left:90,
                                    top:360 ,
                                child:   Column(
                                    children: [
                                Text(
                                  "Patient.",
                                  style: TextStyle(
                                      fontSize: 100,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                                
                                    ],
                                   )
                              ),
                                  ],
                                )
                              ],
                            ),
                          )),
                       ),
                           Card(
                        child: FittedBox(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 410,top: 40),
                                    child: Icon(Icons.battery_charging_full_outlined,
                                    size: 400,color: Colors.blue,),),
                                  
                                     Positioned(
                                  left:35,
                                  top:50 ,
                              child:   Column(
                                  children: [
                                     Text(
                                "Battery ",
                                style: TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              
                                  ],
                                 )
                            ),
                               Positioned(
                                  left:35,
                                  top:130 ,
                              child:   Column(
                                  children: [
                              Text(
                                "Check battery ",
                                style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                              
                                  ],
                                 )
                            ),
                             Positioned(
                                  left:35,
                                  top:180 ,
                              child:   Column(
                                  children: [
                              Text(
                                "consumption.",
                                style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                              
                                  ],
                                 )
                            ),
                                ],
                              )
                            ],
                          ),
                        )),
    ],
                       
                        
                     ),
          ),
           Padding(
            padding: const EdgeInsets.only(left:6,right: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Container(
                margin: EdgeInsets.only(top: 5, bottom: 2),
                width: MediaQuery.of(context).size.width,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
                ),
                    enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey,width: 2)
                ),
                disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blue,width: 2)),
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
        Padding(
          padding: const EdgeInsets.only(top:2,left: 15,right: 10),
          child: Text('HEALTH DATA',style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic),),
        ),
        Padding(
          padding: const EdgeInsets.only(left:10,right: 10),
          child: Card(
            child: Container(
              height:height*0.22 ,
              child: Column(
                children: [
                  Row(
                   
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top:5),
                        child: Icon(Icons.bar_chart_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: Text('  My data'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:210),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                   
                ]
                 
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                    InkWell(
                        onTap: () {
                    Navigator.of(context).pushNamed("loaction");
                  },
                      child: Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.location_on_outlined),
                        ),
                        Text('  Wheel_Chair route'),
                        Padding(
                          padding: const EdgeInsets.only(left:145),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        
                                      
                                      ]
                                       
                                        ),
                    ),
                   const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                    Row(
                   
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(Icons.person),
                      ),
                      Text('  Patient profile'),
                      Padding(
                        padding: const EdgeInsets.only(left:169),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      
                
                ]
                 
                  ),
                    const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                      InkWell(
                            onTap: () {
                    Navigator.of(context).pushNamed("emergen");
                  },
                      child: Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.person_pin),
                        ),
                        Text('    Emergency information'),
                        Padding(
                          padding: const EdgeInsets.only(left:103),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        
                                      
                                      ]
                                       
                                        ),
                    )
                ],
              ),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(top:2,left: 15,right: 10),
          child: Text('OTHER',style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic),),
        ),
        Padding(
          padding: const EdgeInsets.only(left:10,right: 10),
          child: Card(
            child: Container(
              height:height*0.385 ,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                    Navigator.of(context).pushNamed("setting");
                  },
                    child: Row(
                     
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8,top:5),
                          child: Icon(Icons.settings),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:5),
                          child: Text('  Settings'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:207),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                     
                                    ]
                                     
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                    InkWell(
                       onTap: () {
                    Navigator.of(context).pushNamed("listview_help");
                  },
                      child: Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.question_mark_outlined),
                        ),
                        Text('  Help'),
                        Padding(
                          padding: const EdgeInsets.only(left:233),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        
                                      
                                      ]
                                       
                                        ),
                    ),
                    const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                    InkWell(
                        onTap: () {
                    Navigator.of(context).pushNamed("map");
                  },
                      child: Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.location_disabled_outlined),
                        ),
                        Text('  Google Map'),
                        Padding(
                          padding: const EdgeInsets.only(left:183),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        
                                      
                                      ]
                                       
                                        ),
                    ),
                   const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                    InkWell(
                        onTap: () {
                    Navigator.of(context).pushNamed("aboutapp");
                  },
                      child: Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.perm_device_info),
                        ),
                        Text('  About '),
                        Padding(
                          padding: const EdgeInsets.only(left:220),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ]),
                    ),
                       const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                    InkWell(
                        onTap: () async {
                      launchUrl(
                        websitrUri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                      child: Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.cloud_circle),
                        ),
                        Text('  About ECCAT '),
                        Padding(
                          padding: const EdgeInsets.only(left:170),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ]),
                    ),
                       const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                    InkWell(
                       onTap: () {
                    Navigator.of(context).pushNamed("contactus");
                  },
                      child: Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.phone_android_rounded),
                        ),
                        Text('  Contact Us '),
                        Padding(
                          padding: const EdgeInsets.only(left:185),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        
                                      
                                      ]
                                       
                                        ),
                    ),
                    const Divider(
                    color: Colors.black,
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                    InkWell(
                       onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "onboardingapp", (route) => false);
                  },
                      child: Row(
                                         
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 11),
                          child: Icon(Icons.logout),
                        ),
                        Text('  Sign Out '),
                        Padding(
                          padding: const EdgeInsets.only(left:197),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        
                                      
                                      ]
                                       
                                        ),
                    )
                ],
              ),
            )))]);
   
       
        
  
    
    
    
   
                
                  }}


 class CustomSearch extends SearchDelegate {
List username = [
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

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.arrow_back))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuey = [];
    for (var screen in username) {
      if (screen.toLowerCase().contains(query.toLowerCase())) {
        matchQuey.add(screen);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuey[index];
        return ListTile(
          onTap: () {
            _navigateToScreen(context, result);
          },
          title: Text(result),
        );
      },
      itemCount: matchQuey.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuey = [];
    for (var screen in username) {
      if (screen.toLowerCase().contains(query.toLowerCase())) {
        matchQuey.add(screen);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuey[index];
        return ListTile(
          onTap: () {
            _navigateToScreen(context, result);
          },
          title: Text(result),
        );
      },
      itemCount: matchQuey.length,
    );
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
      case "User_profile":
        Navigator.of(context).pushNamed("userprof");
        break;
      default:
        break;
    }
  }
                  }
  
