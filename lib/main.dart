import 'dart:io';
import 'package:eccatapp/generated/l10n.dart';
import 'package:eccatapp/pages/aboutapp.dart';
import 'package:eccatapp/pages/camera.dart';
import 'package:eccatapp/pages/chatbot.dart';
import 'package:eccatapp/pages/contactus.dart';
import 'package:eccatapp/pages/helpscreen.dart';
import 'package:eccatapp/pages/imagepickerr.dart';
import 'package:eccatapp/pages/listview_help.dart';
import 'package:eccatapp/pages/location.dart';
import 'package:eccatapp/pages/map.dart';
import 'package:eccatapp/pages/forgetpassword.dart';
import 'package:eccatapp/auth/login.dart';
import 'package:eccatapp/pages/onboarding.dart';
import 'package:eccatapp/pages/patientinformation.dart';
import 'package:eccatapp/pages/patientprofiledrawer.dart';
import 'package:eccatapp/pages/provider.dart';
import 'package:eccatapp/pages/resetpassword.dart';
import 'package:eccatapp/auth/signup.dart';
import 'package:eccatapp/pages/home_page.dart';
import 'package:eccatapp/pages/setting.dart';
import 'package:eccatapp/pages/userprof.dart';
import 'package:eccatapp/pages/voice.dart';
import 'package:eccatapp/pages/welcomepage.dart';
import 'package:eccatapp/screens/blood_pressure.dart';
import 'package:eccatapp/screens/body_tempreature.dart';
import 'package:eccatapp/screens/emergen.dart';
import 'package:eccatapp/screens/heart_rate.dart';
import 'package:eccatapp/screens/homepageapp.dart';
import 'package:eccatapp/screens/me.dart';
import 'package:eccatapp/screens/onboardingapp.dart';
import 'package:eccatapp/screens/oxgen.dart';
import 'package:eccatapp/screens/weight.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';




String language='EN';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey:'AIzaSyDTaxY9jOFDcFrKaoYpsUqrPYosQgfZKl8' ,
        appId: '1:573000768652:android:4923f1eb60b0982404efa9',
        messagingSenderId: '573000768652',
        projectId: 'vscodeflutter-346d2',
        storageBucket: "eccatapp.appspot.com",)
  )
      :await Firebase.initializeApp();
    WidgetsFlutterBinding.ensureInitialized();
      runApp( MyApp());
    }
  




class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    }); 
    super.initState();
  }


  @override
  Widget build(BuildContext context){
      
        return ChangeNotifierProvider(
          create: (BuildContext context) => UiProvider()..init(),
          child: Consumer<UiProvider>(
            builder: (context,UiProvider notifier ,child) {
              return MaterialApp(
                locale: const Locale('en'),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
                themeMode: notifier.isDark ?ThemeMode.dark :ThemeMode.light,
                darkTheme: notifier.isDark?notifier.darkTheme:notifier.LightTheme,
                home:
           //  FirebaseAuth.instance.currentUser == null ?
                OnBoarding_app(),
               // HomeScreen(),
                routes: {
                  "home_page" :(context) => HomeScreen(),
                  "imagepickerr":(context)=>ImagePickerr(),
                  "welcomepage" :(context) => Welcomepage(),
                  "login" :(context) => Login(),
                  "signup":(context) =>Signup(),
                  "forgetpassword":(context) => ForgetPassword(),
                  "resetpassword":(context) => ResetPassword(),
                  "contactus":(context) =>Contact_us(),
                  "onboarding":(context) => OnBoarding(),
                  "map" :(context) => Map(),
                  "location" :(context) =>Location(),
                  "voice":(context) =>Voice(),
                  "test":(context) => HomeScreen(),
                  "camera" :(context) => Camera(),
                  "aboutapp":(context)=>About_App(),
                  "setting":(context) => SettingsScreen(),
                  "userprof" :(context) => UserInfoPage(),
                  "helpscreen":(context) => Help_Screen(),
                  "patientinformation":(context) =>Patient_information(),
                  "patientprofiledrawer":(context) =>PatientProfilePage(),
                  "chatbot":(context) =>Chat_Bot(),
                  "listview_help" :(context) =>List_help(),
                  "onboardingapp":(context) =>OnBoarding_app(),
                  "homepageapp":(context) => HomePage_app(),
                  "me":(context) =>Me(),
                  "heart_rate":(context) =>Heart_Rate(),
                  "body_tempreature" :(context) => Body_Tempreature(),
                  "oxgen":(context) => Oxygen(),
                  "blood_pressure" :(context) =>Blood_Pressure(),
                  "weight" :(context) => Weight_Body(),
                  "emergen":(context) =>Emergency_information()
                },
              
              
              );
            }
          ),
        );
      }




}