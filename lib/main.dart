import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/splash_screen.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/register.dart';
import 'package:my_app/screens/verification_screen.dart';
import 'package:my_app/screens/forgot_password_screen.dart';
import 'package:my_app/screens/reset_password_screen.dart';
import 'package:my_app/screens/pin_setup_screen.dart';
import 'package:my_app/screens/pin_verification_screen.dart';
import 'package:my_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B735F),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/verification', page: () => const VerificationScreen()),
        GetPage(
            name: '/forgot-password', page: () => const ForgotPasswordScreen()),
        GetPage(
            name: '/reset-password', page: () => const ResetPasswordScreen()),
        GetPage(name: '/pin-setup', page: () => const PinSetupScreen()),
        GetPage(
            name: '/pin-verification',
            page: () => const PinVerificationScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
