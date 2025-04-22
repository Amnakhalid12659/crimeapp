import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/boarding_screen.dart';
import 'package:project/home_screen.dart';
import 'package:project/login_screen.dart';
import 'package:project/splash_screen.dart';
import 'package:project/utils/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCfgqyR8kmjgrQil5YXH8OgruCf35HaYe8",
            authDomain: "crime-analytics-a322e.firebaseapp.com",
            projectId: "crime-analytics-a322e",
            storageBucket: "crime-analytics-a322e.appspot.com",
            messagingSenderId: "958180995213",
            appId: "1:958180995213:web:1e29eb1680dc2b5380f2c4"));
  } else {
    await Firebase.initializeApp();
  }
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
