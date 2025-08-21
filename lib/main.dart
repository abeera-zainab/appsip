 import 'package:appsip/screens/delete-account/delete_account_screen.dart';
import 'package:appsip/screens/edit_bank.dart';
import 'package:appsip/screens/invitation_screen.dart';
import 'package:appsip/screens/logout_screen.dart';
import 'package:appsip/screens/password/change_password_screen.dart';
import 'package:appsip/screens/profile_screen.dart';
import 'package:appsip/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:appsip/screens/tell_us_about_yourself_screen.dart';



// --- Define App Colors ---
class AppColors {
  static const Color background = Color(0xFF1C1D21);
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color primaryRed = Color(0xFFE53935);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color paidGreen = Color(0xFF34C759);
  static const Color pendingYellow = Color(0xFFD1A11E);
  static const Color gradientEndRed= Color(0xFFD93D5A);
  static const Color bottomNavBackground = Color(0xFF1A1A1A);
   static const Color gradientStart = Color(0xFF2DE1C2);
  static const Color gradientEnd = Color(0xFF24A5D5);
  static const Color cardColorsecondary= Color(0xFF261215);
  static const Color black=Color(0x00000080); 
   static const Color gradientStartRed = Color(0xFFF53C5E);
    static const Color profileCardGradientStart = Color(0xFFa499f5);
     static const Color profileCardGradientEnd = Color(0xFF8377e0);
     static const Color divider = Color(0xFF3A3A3C);
      
  
 
  static const Color switchActive = Color(0xFFE94D6A);
  static const Color switchInactive = Color(0xFF4A4A4A);

  static final List<Color> profileBackgrounds = [
    Colors.transparent, // Placeholder for the color picker icon at index 0
    const Color(0xFFFF4848),
    const Color(0xFFFFBF00),
    const Color(0xFF46C85C),
    const Color(0xFF00EE87),
    const Color(0xFF00E1FF),
    const Color(0xFF489BFF),
    const Color(0xFF5548FF),
    const Color(0xFFC532C5),
    const Color(0xFFFF5F8A),
    const Color(0xFFCA0003),
    const Color(0xFF5300B1),
    const Color(0xFF00E5BF),
    const Color(0xFF32E500),
    const Color(0xFF923F00),
  ];
   
}

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
    //const InvitationKeyScreen()
      //const MainScreenShell(),
       //const TellUsAboutYourselfScreen(),
       //const ProfileScreen()
       const DeleteAccountScreen()
       //const RegisterBartenderScreen()22
       //const BankDetailsScreen()
      
    );
  }
}