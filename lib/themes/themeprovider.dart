import 'package:cms/themes/theme.dart';
import 'package:flutter/material.dart';


class Themeprovider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == lightMode){
      _themeData = darkMode;
    }
    else if (_themeData == darkMode){
      _themeData = lightMode;
    }
    notifyListeners();
  }
}