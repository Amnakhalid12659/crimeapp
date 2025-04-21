import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/boarding_screen.dart';
import 'package:project/login_screen.dart';
import 'package:project/utils/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CrimeAnalyticsApp());
}

class CrimeAnalyticsApp extends StatelessWidget {
  const CrimeAnalyticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crime Analytics',
      debugShowCheckedModeBanner: false,
      theme: CAppTheme.lighttheme,
      darkTheme: CAppTheme.darktheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      final user = _auth.currentUser;
      if (user != null) {
        Get.offAll(() => OnBoardingScreen());
      } else {
        Get.offAll(() => Loginscreen());
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/app_logo.png'),
      ),
    );
  }
}
