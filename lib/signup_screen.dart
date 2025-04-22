import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/auth_service.dart';
import 'package:project/login_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/text_strings.dart';
import 'home_screen.dart';
import 'package:project/utils/constants/reuseablecomponents.dart';

class SignupController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;

  final AuthServices _auth = AuthServices();

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
    Get.off(() => Loginscreen());
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      // Validate inputs
      if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
        throw "Please fill in all fields";
      }

      if (password != confirmPassword) {
        throw "Passwords do not match";
      }

      if (password.length < 6) {
        throw "Password must be at least 6 characters";
      }

      isLoading(true);

      final user = await _auth.createUserWithEmailandPassword(
          email.trim(), password.trim());

      if (user != null) {
        // Here you would typically save additional user data to Firestore
        Get.snackbar("Success", "Account created successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        navigateToHome();
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "Email already in use";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;
        case 'weak-password':
          errorMessage = "Password is too weak";
          break;
        default:
          errorMessage = "An error occurred. Please try again";
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

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});

  final SignupController controller = Get.put(SignupController());
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

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
                    Text("Crime",
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: MyColors.primaryColor,
                                )),
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
                child: Container(width: 310, height: 2.8, color: Colors.black),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text("Get Started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryColor,
                    )),
              ),

              // Text Fields
              Componentsbuild.Textbuild(
                controller: namecontroller,
                hintText: "Enter your name",
                icon: Icons.person,
                onIconPressed: () {},
              ),
              Componentsbuild.Textbuild(
                controller: emailcontroller,
                hintText: "Enter your email id",
                icon: Icons.email,
                onIconPressed: () {},
              ),
              Componentsbuild.Textbuild(
                controller: phonecontroller,
                hintText: "Enter your Phone number",
                icon: Icons.call,
                onIconPressed: () {},
              ),
              Obx(() => Componentsbuild.Pswdbuild(
                    controller: passwordcontroller,
                    hintText: "Enter your password",
                    isVisible: controller.isPasswordVisible.value,
                    onToggleVisibility: controller.togglePasswordVisibility,
                  )),
              Obx(() => Componentsbuild.Pswdbuild(
                    controller: confirmpasswordcontroller,
                    hintText: "Confirm password",
                    isVisible: controller.isConfirmPasswordVisible.value,
                    onToggleVisibility:
                        controller.toggleConfirmPasswordVisibility,
                  )),

              // Sign Up Button
              Obx(() => Center(
                    child: InkWell(
                      onTap: controller.isLoading.value
                          ? null
                          : () async {
                              await controller.signUp(
                                name: namecontroller.text,
                                email: emailcontroller.text,
                                phone: phonecontroller.text,
                                password: passwordcontroller.text,
                                confirmPassword: confirmpasswordcontroller.text,
                              );
                            },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
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
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  )),

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
