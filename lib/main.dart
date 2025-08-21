import 'package:appsip/screens/challenges_screen.dart';
import 'package:appsip/screens/invitation_screen.dart';
import 'package:appsip/screens/main_screen_shell.dart';
import 'package:flutter/material.dart';
// --- CHANGE 1: Import the new colors file ---
import 'package:appsip/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sip Skip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primaryRed,
        fontFamily: 'RedHatDisplay',

        // --- CHANGE 2: Add AppBarTheme to match the background ---
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background, // Match the scaffold background
          elevation: 0, // Remove the shadow for a seamless look
          scrolledUnderElevation: 0,
        ),
        
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'RedHatDisplay',
              bodyColor: AppColors.textPrimary,
              displayColor: AppColors.textPrimary,
            ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.cardColor,
          hintStyle: TextStyle(
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
      home: const InvitationKeyScreen(),
    
   
    );
  }
}