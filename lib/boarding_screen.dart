import 'package:flutter/material.dart';
import 'package:project/login_screen.dart';
import 'package:project/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:project/utils/helpers/helperfunctions.dart';
import 'package:project/utils/constants/colors.dart';

class OnBoardingController extends GetxController {
  var count = 0.obs;
}

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Column(
          children: [
            // Title Row ("Crime Analytics")
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Crime",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.bold,
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

            // Onboarding Image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
                height: TheHelperFunctions.screenHeight() * 0.4,
                width: double.infinity,
                child: Obx(
                  () => Image.asset(
                    'assets/onBoard${controller.count.value + 1}.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),

            // Navigation Arrow Button
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (controller.count.value <
                          TextStrings.onBoardingSubTitles.length - 1) {
                        controller.count++;
                      } else {
                        Get.off(() => Loginscreen());
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Onboarding Title
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                child: Text(
                  TextStrings.onBoardingTitles[controller.count.value],
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Onboarding Subtitle
            Obx(
              () => Text(
                TextStrings.onBoardingSubTitles[controller.count.value],
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),

            // "Get Started" Button
            InkWell(
              onTap: () => Get.off(() => Loginscreen()),
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
