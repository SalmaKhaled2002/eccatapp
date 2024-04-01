import 'package:eccatapp/generated/l10n.dart';
import 'package:eccatapp/pages/location.dart';
import 'package:eccatapp/pages/provider.dart';
import 'package:eccatapp/pages/voice.dart';
import 'package:eccatapp/screens/me.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';



class HomePage_app extends StatefulWidget {
  const HomePage_app({super.key});

  @override
  State<HomePage_app> createState() => _HomePage_appState();
}

class _HomePage_appState extends State<HomePage_app> {
 int selectedindex = 0;
  List<Widget> screens = [
    Health(),
    Voice(),
    Location(),
    Me()
  ] ;



  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return
     Scaffold(
      backgroundColor:Colors.white,
       bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            selectedindex = val;
          });
        },
        currentIndex: selectedindex,
        iconSize: 15,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart), label: "Health"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mic), label: S.of(context).tvoice),
               BottomNavigationBarItem(icon: Icon(Icons.not_listed_location_outlined), label: S.of(context).tolocation),
               BottomNavigationBarItem( icon: Icon(Icons.person), label:"Me"),
        ],
      ),


    body: screens[selectedindex],
      );    
  }
}




class Health extends StatelessWidget {
  const Health({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     var height=MediaQuery.of(context).size.height;
    log(height.toDouble());
    return Center(
      child: ListView(
        children: [
          Container(
            padding:EdgeInsets.only(left:15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                   Text('Health',
                   style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                   textAlign: TextAlign.start,
                   overflow: TextOverflow.ellipsis),

                  Consumer<UiProvider>(
                        builder: (context,UiProvider notifier,child)=> IconButton(
                              onPressed: () {
                                notifier.changeTheme();
                                
                              },
                            
                              icon: Icon( notifier.isDark ?Icons.dark_mode:Icons.light_mode,
                                  size: 30, color: notifier.isDark ?Colors.grey:Colors.orange),
                            )), 
                ],
               )
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
            child: Container(
             height: height*0.34,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child:Column(
                children:[
                 Text("Welcome to ",
                 style: TextStyle(fontSize: 25,
                 fontStyle: FontStyle.italic,
                fontWeight:FontWeight.w500,color: Colors.white),
                 textAlign: TextAlign.center,
                 overflow: TextOverflow.ellipsis,),
                 Text("Our application. ",
                 style: TextStyle(fontSize: 25,
                 fontStyle: FontStyle.italic,
                 fontWeight:FontWeight.bold,color: Colors.white),
                 textAlign: TextAlign.center,
                 overflow: TextOverflow.ellipsis,),
                 Container(
                  padding: EdgeInsets.only(top: 34,bottom: 10,left: 15,),
                 child: Text(' Thank you for your use! Get Ready for checking all services in Wheel_Chair.',
                  style: TextStyle(fontSize: 23,
                 fontStyle: FontStyle.italic,
                 fontWeight:FontWeight.w500,color: Colors.white),
                 textAlign: TextAlign.start,),
                 ) ],
                ),
            )),
            
                   GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:5.0,
                      mainAxisSpacing: 5.0,
                    // mainAxisExtent: 150,
                    ),
                    children: [
                      InkWell(
                              onTap: () {
                    Navigator.of(context).pushNamed("heart_rate");
                  },
                        child: Card(
                          child: FittedBox(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 50,top: 60),
                                      child: Image.asset("images/heart.png",
                                      height: 300,fit: BoxFit.fill)
                                    ),
                                       Positioned(
                                    left:20,
                                    top:8 ,
                                child:   Column(
                                    children: [
                                       Text(
                                  "Heart ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                
                                    ],
                                   )
                              ),
                                 Positioned(
                                    left:20,
                                    top:33 ,
                                child:   Column(
                                    children: [
                                Text(
                                  "Check your heart rate throughout the day.",
                                  style: TextStyle(
                                      fontSize: 17,
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
                     
                      InkWell(
                                onTap: () {
                    Navigator.of(context).pushNamed("body_tempreature");
                  },
                        child: Card(
                          child: FittedBox(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                     padding: EdgeInsets.only(left: 150,top: 105),
                                      child: Image.asset("images/temp.PNG",
                                      height: 500,fit: BoxFit.fill),
                                    ),
                                       Positioned(
                                    left:12,
                                    top:8 ,
                                child:   Column(
                                    children: [
                                       Text(
                                  "Skin temperature",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                
                                    ],
                                   )
                              ),
                                 Positioned(
                                    left:12,
                                    top:50 ,
                                child:   Column(
                                    children: [
                                Text(
                                  "Monitor your Skin temperature.",
                                  style: TextStyle(
                                      fontSize: 25,
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
                        InkWell(
                                  onTap: () {
                    Navigator.of(context).pushNamed("weight");
                  },
                          child: Card(
                                                
                          child: FittedBox(
                            child: 
                                Container(
                                  
                                 
                                  child:Stack(
                                    
                                    children:[ 
                                        Container(
                                          padding: EdgeInsets.only(top:60,left: 50),
                                          child: Image.asset("images/weight.PNG",
                                           height: 300,fit: BoxFit.fill),
                                        ),
                                  Positioned(
                                    left:20,
                                    top:8 ,
                                child:   Column(
                                    children: [
                                       Text(
                                  "Weight",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                
                                    ],
                                   )
                              ),
                                 Positioned(
                                    left:20,
                                    top:33 ,
                                child:   Column(
                                    children: [
                                Text(
                                  "Click, write inside your weight.",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                                
                                    ],
                                   )
                              ),
                               
                                    
                                               ]) )
                            
                          
                             
                              )
                          ),
                        ),
                  
                          
                    InkWell(    
                               onTap: () {
                    Navigator.of(context).pushNamed("blood_pressure");
                  },
                     
                   child:Card(
                        child: FittedBox(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 60,top: 200),
                                    
                                    child: Image.asset("images/blood.PNG",
                                    height: 500,fit: BoxFit.fill),
                                  ),
                                   Positioned(
                                  left:20,
                                  top:0 ,
                              child:   Column(
                                  children: [
                                     Text(
                                "Blood Pressure",
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              
                                  ],
                                 )
                            ),
                               Positioned(
                                  left:20,
                                  top:60 ,
                              child:   Column(
                                  children: [
                              Text(
                                "Keep an eye on your blood pressure. ",
                                style: TextStyle(
                                    fontSize: 35,
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
                        )),),
                      InkWell(
                                   onTap: () {
                    Navigator.of(context).pushNamed("oxgen");
                  },
                        child: Card(
                          color: Colors.white,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Stack(
                                  children:[ Container(
                                    padding: EdgeInsets.only(left:60,top:60),
                                    child: Image.asset("images/oxygen.PNG",
                                    height: 300,fit: BoxFit.fill),
                                  ),
                                  Positioned(
                                    left:8,
                                    top:8 ,
                                child:   Column(
                                    children: [
                                       Text(
                                  "SpO2",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                
                                    ],
                                   )
                              ),
                                 Positioned(
                                    left:8,
                                    top:40 ,
                                child:   Column(
                                    children: [
                                Text(
                                  "Check your oxgen level. ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                                
                                    ],
                                   )
                              ),
                                ]  )
                              ],
                            ),
                          )),
                      )]
                        )]));
  }
}