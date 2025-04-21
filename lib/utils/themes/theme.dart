import 'package:flutter/material.dart';
import 'package:project/utils/themes/texttheme.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CTextTheme.lightTextTheme,
    primaryColor: Colors.blue,
  );
  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CTextTheme.darkTextTheme,
    primaryColor: Colors.blue,
  );
}
