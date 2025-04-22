import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/auth_service.dart';
import 'package:project/emergencyycontacts_screen.dart';
import 'package:project/feedback_screen.dart';
import 'package:project/login_screen.dart';
import 'package:project/resetpswd_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: MyColors.pinkGradient,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 16, left: 19),
              child: Text(
                "Profile & Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 25, right: 15, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      foregroundImage: AssetImage('assets/person.png'),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Amna Khalid",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "+92 3254114397",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: 420,
                  height: 1,
                  color: Colors.black,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 14, bottom: 14),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                _buildText(
                  text: "Change Password",
                  icon: const Icon(
                    CupertinoIcons.lock_shield,
                    size: 16,
                    color: Color(0xFF2E5C8F),
                  ),
                  onTap: () => Get.to(() => Resetpwdscreen()),
                ),
                const SizedBox(height: 14),
                _buildText(
                  text: "Update Emergency Contacts",
                  icon: const Icon(
                    CupertinoIcons.phone_badge_plus,
                    size: 16,
                    color: Color(0xFF2E5C8F),
                  ),
                  onTap: () => Get.to(() => EmergencyContactsScreen()),
                ),
                const SizedBox(height: 14),
                _buildText(
                  text: "Feedback",
                  icon: const Icon(
                    CupertinoIcons.chat_bubble_text,
                    size: 16,
                    color: Color(0xFF2E5C8F),
                  ),
                  onTap: () => Get.to(() => FeedbackScreen()),
                ),
                const SizedBox(height: 14),
                _buildText(
                  text: "Log Out",
                  icon: const Icon(
                    CupertinoIcons.arrow_right_square,
                    size: 16,
                    color: Color(0xFF2E5C8F),
                  ),
                  onTap: () => _showLogoutDialog(),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Column(
                    children: [
                      Text(
                        "Powered By ",
                        style: TextStyle(fontSize: 16, color: Colors.black45),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Information Technology Board Projects",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build text
  Widget _buildText({
    required String text,
    required Widget icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          const SizedBox(width: 22),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Logout Dialog
  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Log Out"),
        content: const Text("Do you really want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              "Cancel",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () async {
              await _auth.signout();
            },
            child: const Text(
              "Yes",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
