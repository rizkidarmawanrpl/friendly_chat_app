import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static final ThemeData iOS = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor : Colors.grey[100],
    brightness   : Brightness.light,
  );

  static final ThemeData android = ThemeData(
    brightness   : Brightness.light,
    primarySwatch: Colors.teal,
    primaryColor : Colors.lime,
    appBarTheme  : const AppBarTheme(
      iconTheme         : IconThemeData(color: Colors.white, size: 20.0),
      color             : Colors.teal,
      foregroundColor   : Colors.white,
      elevation         : 4.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor         : Colors.teal,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness    : Brightness.dark,
      ),
    ),
    indicatorColor         : Colors.purple,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    iconTheme              : const IconThemeData(
      color: Colors.white,
      size : 20.0,
    ),
    backgroundColor: Colors.white,
    tabBarTheme    : const TabBarTheme(
      labelColor          : Color(0xffce107c),
      unselectedLabelColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      caption: TextStyle(
        color:Color(0xFFCCC5AF),
      ),
      headline1: TextStyle(color: Colors.deepPurpleAccent),
      headline2: TextStyle(color: Colors.amberAccent),
      subtitle1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.redAccent),
    ),
  );

  static bool isIos(BuildContext context) => Theme.of(context).platform == TargetPlatform.iOS;
}