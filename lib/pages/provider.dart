import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier{
  bool _isDark =false;
  bool get isDark => _isDark;
  late SharedPreferences storage;

final darkTheme =ThemeData(
primaryColor: Colors.grey,
brightness: Brightness.dark,
primaryColorDark: Colors.grey

);


final LightTheme=ThemeData(
 primaryColor: Colors.white,
 brightness: Brightness.light,
 primaryColorLight: Colors.white


);
  changeTheme(){
    _isDark =!isDark;
    storage.setBool("isDark",_isDark);
    notifyListeners();
  }


  init ()async{
   storage=await SharedPreferences.getInstance();
    _isDark=storage.getBool("isDark") ??false;
    notifyListeners();
  }

   
}