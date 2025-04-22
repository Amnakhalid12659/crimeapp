import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/auth_service.dart';
import 'package:project/navigationbar_screen.dart';
import 'package:project/resetpswd_screen.dart';
import 'package:project/signup_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/reuseablecomponents.dart';
import 'package:project/utils/constants/text_strings.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void navigateToHome() {
    Get.offAll(() => NavigationbarScreen());
  }

  void navigateToSignUp() {
    Get.off(() => Signupscreen());
  }

  Future<void> loginUser(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw "Please fill in all fields";
      }

      if (!GetUtils.isEmail(email)) {
        throw "Please enter a valid email address";
      }

      isLoading(true);
      final user =
          await AuthServices().loginUserWithEmailandPassword(email, password);

      if (user != null) {
        Get.snackbar("Success", "Login successful",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        navigateToHome();
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "No user found with this email";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;
        default:
          errorMessage = "Login failed. Please try again";
      }
      Get.snackbar("Error", errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }
}

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final LoginController controller = Get.put(LoginController());
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
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
              const SizedBox(height: 20),

              // Email Field
              Componentsbuild.Textbuild(
                controller: emailcontroller,
                hintText: "Enter your email id",
                icon: Icons.email,
                onIconPressed: () {},
              ),
              const SizedBox(height: 15),

              // Password Field
              Obx(() => Componentsbuild.Pswdbuild(
                    controller: passwordcontroller,
                    hintText: "Enter your password",
                    isVisible: controller.isPasswordVisible.value,
                    onToggleVisibility: controller.togglePasswordVisibility,
                  )),
              const SizedBox(height: 5),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.to(() => Resetpwdscreen()),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: MyColors.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Login Button
              Obx(() => Center(
                    child: InkWell(
                      onTap: controller.isLoading.value
                          ? null
                          : () => controller.loginUser(
                                emailcontroller.text.trim(),
                                passwordcontroller.text.trim(),
                              ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: controller.isLoading.value
                              ? Colors.grey
                              : MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'LOG IN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: controller.navigateToSignUp,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
