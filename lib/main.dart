import 'package:appsip/screens/invitation_screen.dart';
import 'package:appsip/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:appsip/screens/main_screen_shell.dart';

// --- Define App Colors ---
class AppColors {
  static const Color background = Color(0xFF121212);
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color primaryRed = Color(0xFFE53935);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color paidGreen = Color(0xFF34C759);
  static const Color pendingYellow = Color(0xFFD1A11E);
  static const Color failedRed = Color(0xFFE53935);
  static const Color bottomNavBackground = Color(0xFF1A1A1A);
   static const Color gradientStart = Color(0xFF2DE1C2);
  static const Color gradientEnd = Color(0xFF24A5D5);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earnings App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primaryRed,
        // Set the font family name directly from pubspec.yaml
        fontFamily: 'RedHatDisplay',
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'RedHatDisplay',
              bodyColor: AppColors.textPrimary,
              displayColor: AppColors.textPrimary,
            ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.cardColor,
          hintStyle: TextStyle(
            // ignore: deprecated_member_use
            color: const Color(0xFFB0B0B0).withOpacity(0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: AppColors.primaryRed,
              width: 1.5,
            ),
          ),
        ),
      ),
      home: 
      const RegisterBartenderScreen()
      //const MainScreenShell(),
      
    );
  }
}