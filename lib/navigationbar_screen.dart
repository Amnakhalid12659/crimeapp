import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project/profile_screen.dart';
import 'package:project/emergencyycontacts_screen.dart';
import 'package:project/home_screen.dart';
import 'package:project/safetycheck_screen.dart';

class NavigationbarScreen extends StatefulWidget {
  const NavigationbarScreen({super.key});

  @override
  State<NavigationbarScreen> createState() => _NavigationbarScreenState();
}

class _NavigationbarScreenState extends State<NavigationbarScreen> {
  int index = 0;
  final items = [
    Icon(
      CupertinoIcons.house_fill,
      size: 22,
      color: Colors.white,
    ),
    Icon(
      CupertinoIcons.location_solid,
      size: 22,
      color: Colors.white,
    ),
    Icon(
      CupertinoIcons.phone_fill,
      size: 22,
      color: Colors.white,
    ),
    Icon(
      CupertinoIcons.person_fill,
      size: 22,
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        color: Color(0xFF0F9FF5),
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
      ),
      body: getSelectedWidget(index: index),
    );
  }

  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 0:
        return Homescreen();
      case 1:
        return Safetycheckscreen();
      case 2:
        return EmergencyContactsScreen();
      case 3:
        return ProfileScreen();
      default:
        return Homescreen();
    }
  }
}
