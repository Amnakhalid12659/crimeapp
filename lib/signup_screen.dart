import 'package:flutter/material.dart';
import 'package:project/login_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/text_strings.dart';
import 'home_screen.dart';
import 'package:project/utils/constants/reuseablecomponents.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void navigateToHome() {
    Get.off(Homescreen());
  }

  void navigateToLogin() {
    Get.off(Loginscreen());
  }
}

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Crime",
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                    color: MyColors.primaryColor,
                  ),
                ),
              ),

              // Text Fields
              Componentsbuild.Textbuild(
                hintText: "Enter your name",
                icon: Icons.person,
                onIconPressed: () {},
              ),
              Componentsbuild.Textbuild(
                hintText: "Enter your email id",
                icon: Icons.email,
                onIconPressed: () {},
              ),
              Componentsbuild.Textbuild(
                hintText: "Enter your Phone number",
                icon: Icons.call,
                onIconPressed: () {},
              ),
              Obx(() => Componentsbuild.Pswdbuild(
                    hintText: "Enter your password",
                    isVisible: controller.isPasswordVisible.value,
                    onToggleVisibility: controller.togglePasswordVisibility,
                  )),
              Obx(() => Componentsbuild.Pswdbuild(
                    hintText: "Confirm password",
                    isVisible: controller.isConfirmPasswordVisible.value,
                    onToggleVisibility:
                        controller.toggleConfirmPasswordVisibility,
                  )),

              // Sign Up Button
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
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              // Login Link
              InkWell(
                onTap: controller.navigateToLogin,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    child: const Text(
                      "Already had an account? Login",
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
      ),
    );
  }
}
