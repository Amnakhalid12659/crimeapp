import 'package:flutter/material.dart';
import 'package:project/home_screen.dart';
import 'package:project/login_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/reuseablecomponents.dart';
import 'package:project/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ResetController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void navigateToHome() {
    Get.off( Homescreen());
  }
}

class Resetpwdscreen extends StatelessWidget {
  Resetpwdscreen({super.key});
  final ResetController controller = Get.put(ResetController());

  final bool _isNewPasswordVisible = false;
  final bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Crime",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: MyColors.primaryColor,
                        ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Analytics",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                TextStrings.tagline,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: MyColors.primaryColor,
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 310,
                height: 2.8,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E5C8F),
                ),
              ),
            ),
            Obx(() => Componentsbuild.Pswdbuild(
                  hintText: "Enter your new password",
                  isVisible: controller.isPasswordVisible.value,
                  onToggleVisibility: controller.togglePasswordVisibility,
                )),
            Obx(() => Componentsbuild.Pswdbuild(
                  hintText: "Confirm your password",
                  isVisible: controller.isPasswordVisible.value,
                  onToggleVisibility: controller.togglePasswordVisibility,
                )),
            SizedBox(height: 30),

            // Reset Button
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(Loginscreen());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF2E5C8F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "RESET PASSWORD",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build password fields
  Widget _buildPasswordField({
    required String hintText,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return Center(
      child: SizedBox(
        width: 300,
        child: TextField(
          obscureText: !isVisible, // Toggle password visibility
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF2E5C8F).withOpacity(0.5),
            ),
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
      ),
    );
  }
}
