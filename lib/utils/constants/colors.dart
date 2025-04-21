import 'package:flutter/material.dart';

class MyColors {
  MyColors._();
  static Color primaryColor = Color(0xFF2E5C8F);
  static Color secondaryColor =Color(0xFF37AFE1);
  static Color textPrimary = Color(0xFF333333);
  static Color textSecondary = Color(0xFF6C757D);
  static Color light = Color(0xFFF6F6F6);
  static Color dark = Color(0xFF272727);
  static Color primarybtn = Color(0x0ff4b8ff);
  static Color secondarybtn = Color(0xFF6C757D);
  static Color error = Color(0xFFD32F2F);
  static Color success = Color(0xFF388E3C);
  static Color warning = Color(0x0ff57c00);
  static Color info = Color(0xFF197602);

  static Gradient pinkGradient = LinearGradient(
    colors: [
      Color(0xFFFF80C0), // Hot Pink
      Color(0xFF0F9FF5)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Gradient blueVioletGradient = LinearGradient(
    colors: [
      Color(0xFF08A9FF), // Dodger Blue
      Color(0xFFCE87FF) // Heliotrope (purple)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
