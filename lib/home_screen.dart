import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/emergencyycontacts_screen.dart';
import 'package:project/feedback_screen.dart';
import 'package:project/harrasmentlaws.dart';
import 'package:project/report_screen.dart';
import 'package:project/safetycheck_screen.dart';
import 'package:project/safetytips_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/helpers/helperfunctions.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                gradient: MyColors.pinkGradient,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: SafeArea(
                child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Hello, ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${user!.email}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  color: Colors.white, size: 18),
                              SizedBox(width: 8),
                              Text(
                                TheHelperFunctions.getCurrentDateTime(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.menu, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12)
              ],
            )),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(top: 12, bottom: 12),
            child: TextField(
              style: TextStyle(color: Colors.grey.withOpacity(0.5)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.black38),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildContainer(
                        text: "Location Review",
                        imgPath: 'assets/icon1.png',
                        Tap: () => Get.to(Safetycheckscreen()),
                      ),
                      _buildContainer(
                        text: "Women Harassment",
                        imgPath: 'assets/icon2.jpg',
                        Tap: () => Get.to(HarrasmentlawScreen()),
                      ),
                      _buildContainer(
                        text: "Crime   Complaints",
                        imgPath: 'assets/icon4.png',
                        Tap: () => Get.to(CrimeReportScreen()),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildContainer(
                        text: "Traffic Services",
                        imgPath: 'assets/icon3.png',
                        Tap: () => Get.to(SafetyTipsScreen()),
                      ),
                      _buildContainer(
                        text: "Feedback",
                        imgPath: 'assets/icon5.png',
                        Tap: () => Get.to(FeedbackScreen()),
                      ),
                      _buildContainer(
                        text: "Find Police Stations",
                        imgPath: 'assets/icon6.png',
                        Tap: () => Get.to(EmergencyContactsScreen()),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildContainer(
                        text: " Safety Tips and Guidelines",
                        imgPath: 'assets/icon7.png',
                        Tap: () => Get.to(SafetyTipsScreen()),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildContainer({
  required String text,
  required String imgPath,
  VoidCallback? Tap,
}) {
  return InkWell(
    onTap: Tap,
    child: Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
