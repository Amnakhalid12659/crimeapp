import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/navigationbar_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:get/get.dart';

class FeedbackScreen extends StatelessWidget {
  final TextEditingController feedbackController = TextEditingController();

  FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            padding: EdgeInsets.only(top: 16, bottom: 12, left: 18),
            decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Text(
              "Feedback",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Give Your Feedback....!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: TextField(
                    maxLength: 256,
                    maxLines: 10,
                    controller: feedbackController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter your feedback for our application...",
                      hintStyle: TextStyle(
                        color: Color(0xFF2E5C8F).withOpacity(0.5),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.pencil_circle,
                          color: Color(0xFF2E5C8F),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFF2E5C8F),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFF2E5C8F),
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      if (feedbackController.text.isNotEmpty) {
                        Get.snackbar('Success',
                            'Your valuable feedback has been submitted successfully!',
                            backgroundColor: Colors.blueGrey,
                            colorText: Colors.white,
                            duration: Duration(seconds: 3));

                        Future.delayed(const Duration(milliseconds: 500), () {
                          Get.to(() => NavigationbarScreen());
                        });
                      } else {
                        Get.snackbar("Error", "You didn't enter any feedback",
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            duration: Duration(seconds: 3));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: Text(
                        'Submit Feedback',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
