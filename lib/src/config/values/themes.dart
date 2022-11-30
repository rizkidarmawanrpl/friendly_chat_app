import 'package:flutter/material.dart';

class Themes {
  static final ThemeData iOS = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    brightness: Brightness.light,
  );

  static final ThemeData android = ThemeData(
    primarySwatch: Colors.purple,
    colorScheme: const ColorScheme.light(brightness: Brightness.light),
  );

  static bool isIos(BuildContext context) => Theme.of(context).platform == TargetPlatform.iOS;
}
