import 'package:flutter/material.dart';
import 'package:project/resetpswd_screen.dart';
import 'package:project/signup_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/reuseablecomponents.dart';
import 'home_screen.dart';
import 'package:project/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void navigateToHome() {
    Get.off(Homescreen());
  }

  void navigateToSignUp() {
    Get.off(Signupscreen());
  }
}

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header Section
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

            // Text Fields
            Componentsbuild.Textbuild(
              hintText: "Enter your email id",
              icon: Icons.email,
              onIconPressed: () {},
            ),

            Obx(() => Componentsbuild.Pswdbuild(
                  hintText: "Enter your password",
                  isVisible: controller.isPasswordVisible.value,
                  onToggleVisibility: controller.togglePasswordVisibility,
                )),
            InkWell(
              onTap: () {
                Get.to(Resetpwdscreen());
              },
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: const EdgeInsets.only(top: 12, bottom: 20),
                child: const Text(
                  "Forget Password ? Go Reset your password !",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: controller.navigateToHome,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: controller.navigateToSignUp,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 20),
                  child: const Text(
                    "Don't had an account? SignUp",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
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
}
