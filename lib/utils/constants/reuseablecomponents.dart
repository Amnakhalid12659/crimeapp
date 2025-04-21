import 'package:flutter/material.dart';

class Componentsbuild {
  Componentsbuild._();

  static Widget Textbuild({
    required String hintText,
    required IconData icon,
    required VoidCallback onIconPressed,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(top: 12, bottom: 12),
      width: double.infinity,
      child: TextField(
        style: TextStyle(color: Color(0xFF1B3051)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF2E5C8F).withOpacity(0.5)),
          suffixIcon: IconButton(
            onPressed: onIconPressed,
            icon: Icon(
              icon,
              color: Color(0xFF2E5C8F),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Color(0xFF2E5C8F),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Color(0xFF2E5C8F),
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
    );
  }

// Helper function for password fields
  static Widget Pswdbuild({
    required String hintText,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(top: 12, bottom: 12),
      width: double.infinity,
      child: TextField(
        obscureText: !isVisible,
        style: TextStyle(color: Color(0xFF1B3051)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF2E5C8F).withOpacity(0.5)),
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF2E5C8F),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Color(0xFF2E5C8F),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Color(0xFF2E5C8F),
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
    );
  }
}
