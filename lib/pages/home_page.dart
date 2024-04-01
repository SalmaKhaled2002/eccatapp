import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccatapp/generated/l10n.dart';
import 'package:eccatapp/pages/patientinformation.dart';
import 'package:eccatapp/pages/patientprofiledrawer.dart';
import 'package:eccatapp/pages/provider.dart';
import 'package:eccatapp/pages/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eccatapp/pages/userprof.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _MyHome();
}

class _MyHome extends State<HomeScreen> {
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

  List<Widget> Relativescreens = [
    HomeLayout(),
    Patient_information(),
    SettingsScreen()
  ] ;
  List<Widget> Petientscreens = [
    HomeLayout(),
    SettingsScreen()
  ] ;


  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    uid = user.currentUser!.uid;
    final DocumentSnapshot docUser =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (docUser.exists) {
      setState(() {
        uid = docUser.get('uid');
        username = docUser.get('username');
        email = docUser.get('email');
        phone = docUser.get('phone');
        gender = docUser.get('gender');
        role = docUser.get('role');
        username_patient = docUser.get('username_patient');
        age = docUser.get('age');
        diseases = docUser.get('Diseases');
        medicine = docUser.get('Medicine');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            selectedindex = val;
          });
        },
        currentIndex: selectedindex,
        iconSize: 24,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        selectedFontSize: 21,
        unselectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: S.of(context).thomepage),
          if(role=='Relative')
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: S.of(context).tPatient_profile),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: S.of(context).tSettings),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 15),
          width: 288,
          height: double.infinity,
          color: Colors.white,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('uid', isEqualTo: user.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if(role=='Relative') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserInfoPage(),
                                ),
                              );
                            }else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PatientProfilePage(),
                                ),
                              );
                            }
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 33, 39, 59),
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 150,
                          child: Column(
                            children: [
                              Text(
                                username ?? 'No Name',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF674AEF)),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                email ?? 'No Email',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF674AEF)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    S.of(context).thomepage,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.home, size: 35),
                  onTap: () {
                    Navigator.of(context).pushNamed("test");
                  },
                ),
                // if(role=='Relative')
                ListTile(
                  title: Text(
                    "Chat_GPT",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.chat, size: 35),
                  onTap: () {
                    Navigator.of(context).pushNamed("helpscreen");
                  },
                ),
                // ListTile(
                //   title: Text(
                //     "Chat_Bot",
                //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                //   ),
                //   leading: Icon(Icons.chat_outlined, size: 35),
                //   onTap: () {
                //     Navigator.of(context).pushNamed("chatbot");
                //   },
                // ),
                ListTile(
                  title: Text(
                    S.of(context).thelp,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.chat_outlined, size: 35),
                  onTap: () {
                    Navigator.of(context).pushNamed("listview_help");
                  },
                ),
                ListTile(
                    title: Text(
                      S.of(context).tabouteccat,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.cloud_circle, size: 35),
                    onTap: () async {
                      launchUrl(
                        websitrUri,
                        mode: LaunchMode.externalApplication,
                      );
                    }),
                ListTile(
                  title: Text(
                    S.of(context).taboutapp,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.settings, size: 35),
                  onTap: () {
                    Navigator.of(context).pushNamed("aboutapp");
                  },
                ),
                ListTile(
                  title: Text(
                   S.of(context).tcontactus,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.phone_android_outlined, size: 35),
                  onTap: () {
                    Navigator.of(context).pushNamed("contactus");
                  },
                ),
                ListTile(
                  title: Text(
                    S.of(context).Signout,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.exit_to_app, size: 35),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "welcomepage", (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: role=='Relative'? Relativescreens[selectedindex] : Petientscreens[selectedindex],
    );
  }
}

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
          decoration: BoxDecoration(
              color: Color(0xFF674AEF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                      builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(Icons.dashboard,
                                size: 30, color: Colors.white),
                          )),
                        Consumer<UiProvider>(
                      builder: (context,UiProvider notifier,child)=> IconButton(
                        
                            onPressed: () {
                             
                              notifier.changeTheme();
                            },
                            
                            icon: Icon( notifier.isDark ?Icons.dark_mode:Icons.light_mode,
                                size: 30, color: Colors.white),
                          )), 
                          
                  // Icon(
                  //   Icons.notifications,
                  //   size: 30,
                  //   color: Colors.white,
                  // ),
                  
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3, bottom: 15),
                child: Text(
                  S.of(context).tohidear,
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
                margin: EdgeInsets.only(top: 5, bottom: 20),
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
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(children: [
              GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.1),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("map");
                      },
                      child: Column(children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFFFFCF2F),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(Icons.explore,
                                  size: 40, color: Colors.white),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Map",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("voice");
                      },
                      child: Column(children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFF6FE08D),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(Icons.mic,
                                  size: 40, color: Colors.white),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Voice",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("imagepickerr");
                      },
                      child: Column(children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFF618DFD),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(Icons.add_a_photo,
                                  size: 40, color: Colors.white),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ]),
                    ),
                    Column(children: [
                      Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xfffc7f7f), shape: BoxShape.circle),
                          child: Center(
                            child: Icon(Icons.battery_charging_full,
                                size: 40, color: Colors.white),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Battery",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                    ]),
                    Column(children: [
                      Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFCB84FB), shape: BoxShape.circle),
                          child: Center(
                            child: Icon(Icons.health_and_safety,
                                size: 40, color: Colors.white),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "HealthCare",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                    ])
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Features",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF674AEF)),
                  )
                ],
              ),
              GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                            (4 * 240),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  children: [
                    Card(
                        child: FittedBox(
                      child: Container(
                          padding: EdgeInsets.only(bottom: 1),
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F3FF),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(children: [
                            Image.asset(
                              "images/Location.png",
                              height: 180,
                              scale: 0.3,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Location",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ])),
                    )),
                    Card(
                        child: FittedBox(
                      child: Container(
                          padding: EdgeInsets.only(bottom: 1),
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F3FF),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(children: [
                            Image.asset(
                              "images/AI.png",
                              height: 180,
                              scale: 0.3,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Ai",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ])),
                    )),
                  ])
            ]))
      ],
    );
  }
}

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