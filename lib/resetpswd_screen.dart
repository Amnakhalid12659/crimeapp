import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/auth_service.dart';
import 'package:project/home_screen.dart';
import 'package:project/login_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/reuseablecomponents.dart';
import 'package:project/utils/constants/text_strings.dart';

class ResetController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void navigateToHome() {
    Get.offAll(() => Homescreen());
  }

  void navigateToLogin() {
    Get.offAll(() => Loginscreen());
  }

  Future<void> resetPassword(String newPassword, String confirmPassword) async {
    try {
      if (newPassword.isEmpty || confirmPassword.isEmpty) {
        throw "Please fill in all fields";
      }

      if (newPassword.length < 6) {
        throw "Password must be at least 6 characters";
      }

      if (newPassword != confirmPassword) {
        throw "Passwords do not match";
      }

      isLoading(true);

      // Here you would typically implement your password reset logic
      // For example, if using Firebase Auth:
      // await AuthServices().resetPassword(newPassword);

      // For demo purposes, we'll just simulate a successful reset
      await Future.delayed(Duration(seconds: 2));

      Get.snackbar("Success", "Password reset successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      navigateToLogin();
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

class Resetpwdscreen extends StatelessWidget {
  Resetpwdscreen({super.key});

  final ResetController controller = Get.put(ResetController());
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MyColors.primaryColor),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Reset Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: MyColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Create a new password for your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

              // Password Fields
              Obx(() => Componentsbuild.Pswdbuild(
                    controller: passwordcontroller,
                    hintText: "Enter your new password",
                    isVisible: controller.isPasswordVisible.value,
                    onToggleVisibility: controller.togglePasswordVisibility,
                  )),
              const SizedBox(height: 20),
              Obx(() => Componentsbuild.Pswdbuild(
                    controller: confirmpasswordcontroller,
                    hintText: "Confirm your new password",
                    isVisible: controller.isConfirmPasswordVisible.value,
                    onToggleVisibility:
                        controller.toggleConfirmPasswordVisibility,
                  )),
              const SizedBox(height: 30),

              // Reset Button
              Obx(() => Center(
                    child: InkWell(
                      onTap: controller.isLoading.value
                          ? null
                          : () => controller.resetPassword(
                                passwordcontroller.text.trim(),
                                confirmpasswordcontroller.text.trim(),
                              ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
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
                            : Text(
                                "RESET PASSWORD",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
