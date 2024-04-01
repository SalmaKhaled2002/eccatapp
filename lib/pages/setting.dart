

import 'package:eccatapp/generated/l10n.dart';

import 'package:eccatapp/pages/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}


class _SettingsScreenState extends State<SettingsScreen> {
List <String > _languages =['Arabic','English','Chinese'];
String ?_selectedLanguage ;
bool _darkMode= false;
  // Language _languade=Language();

  @override
  void initState() {
    super.initState();
    // getSelectedPref();
  }
 
  @override
  Widget build(BuildContext context) {
//      final text =MediaQuery.of(context).platformBrightness == Brightness.dark
//  ?'DarkTheme' :'LightTheme';
    return Scaffold(
      backgroundColor:Colors.white,

     body:  Container(
      padding: EdgeInsets.only(top: 45),
      child: SingleChildScrollView(
        child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
        Padding(padding:EdgeInsets.only(top: 0,bottom: 10,left: 10,right: 10),
        child: Card(
          color: Colors.purple,
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListTile(
              leading: Icon(Icons.settings,color: Colors.white,size: 33,),
              title: Text(S.of(context).tSettings,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 38),),
              
            ),
          ),
        ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                title: Text(S.of(context).tChangeLanguage),
                leading: Icon(Icons.language,color: Colors.purple,),
                trailing: DropdownButton(
                  hint: Text('Language'),
                  value: _selectedLanguage,
                  onChanged:(newValue)async{
                    setState(() {
                      _selectedLanguage=newValue;
                    });
                  },
                  items: _languages.map((lang){
                    return DropdownMenuItem(
                      child: new Text(lang),
                      value: lang,
                      );
                  }).toList()),
              ),
               Consumer<UiProvider>(
                 builder: (context,UiProvider notifier,child) {
                   return ListTile(
                    title: Text(S.of(context).tdarkmode),
                    leading: Icon( notifier.isDark ?Icons.dark_mode:Icons.light_mode,),
                    trailing: Switch(
                      value: notifier.isDark,
                     onChanged: (value) => notifier.changeTheme()
                     ),
                     );
                 }
               ),
               
              // ListTile(
              //   title: Text('Dark Mode'),
              //   leading: Icon(Icons.dark_mode,color: Colors.black,),
              //   trailing:ChangeThemeButtonWidget(), 
              // ),
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
        )
       ],
        ),
      ),
    ));

 
   
    
  
    
    
  }
  
  // getSelectedPref()async{
  //   SharedPreferences pref =await SharedPreferences.getInstance();
  //   setState(() {
  //     _selectedLanguage=pref.getString('language');
  //     _darkMode = pref.getBool('darkMode');
  //   });
  }


