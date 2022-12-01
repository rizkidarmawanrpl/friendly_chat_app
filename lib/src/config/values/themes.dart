import 'package:flutter/material.dart';

final ThemeData base = ThemeData.light();

TextTheme basicTextTheme(TextTheme base) {
  return base.copyWith(
    headlineLarge: base.headline1?.copyWith(
      fontFamily: 'Roboto',
      fontSize: 32.0,
      color: Colors.black,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontFamily: 'Merriweather',
      fontSize: 22.0,
      color: Colors.green
    ),
    displayLarge: base.displayLarge?.copyWith(
      fontFamily: 'Roboto',
      fontSize: 57.0,
      color: Colors.white,
    ),
    caption: base.caption?.copyWith(
      color: const Color(0xFFCCC5AF),
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontSize: 16.0,
      color: const Color(0xFF807A6B)
    )
  );
}

  

class Themes {
  static final ThemeData iOS = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor : Colors.grey[100],
    brightness   : Brightness.light,
  );

  static final ThemeData android = ThemeData(
    primarySwatch: Colors.purple,
    /* colorScheme  : const ColorScheme.light(brightness: Brightness.light), */
    primaryColor: const Color(0xffce107c),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 20.0,
    ),
    backgroundColor: Colors.white,
    tabBarTheme: base.tabBarTheme.copyWith(
      labelColor: const Color(0xffce107c),
      unselectedLabelColor: Colors.grey,
    )
  );

  static final ThemeData customTheme = base.copyWith(
    // textTheme: basicTextTheme(base.textTheme),
    primaryColor: const Color(0xffce107c),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 20.0,
    ),
    backgroundColor: Colors.white,
    tabBarTheme: base.tabBarTheme.copyWith(
      labelColor: const Color(0xffce107c),
      unselectedLabelColor: Colors.grey,
    )
  );

  static bool isIos(BuildContext context) => Theme.of(context).platform == TargetPlatform.iOS;
}