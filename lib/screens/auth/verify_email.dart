// lib/screens/auth/verify_email_screen.dart
import 'dart:async';
import 'package:appsip/screens/tell_us_about_yourself_screen.dart';
import 'package:appsip/services/firebase_auth_service.dart';
import 'package:appsip/theme/app_colors.dart';
import 'package:appsip/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  Timer? _timer;
  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    _isEmailVerified = _authService.getCurrentUser()?.emailVerified ?? false;
    if (!_isEmailVerified) {
      _authService.sendEmailVerification();
      _timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => _checkEmailVerified(),
      );
    }
  }

  _checkEmailVerified() async {
    await _authService.reloadUser();
    setState(() {
      _isEmailVerified = _authService.getCurrentUser()?.emailVerified ?? false;
    });

    if (_isEmailVerified) {
      _timer?.cancel();
      // Navigate to the next screen after verification
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const TellUsAboutYourselfScreen()),
        );
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Your Email"),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/mail.svg', // Assuming you have a mail icon
              height: 100,
             
            ),
            const SizedBox(height: 32),
            const Text(
              "A verification email has been sent to your registered email address. Please verify your email to continue.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            _isEmailVerified
                ? const Text(
                    "Email Verified! Redirecting...",
                    style: TextStyle(color: AppColors.paidGreen, fontSize: 18, fontWeight: FontWeight.bold),
                  )
                : PrimaryButton(
                    text: "Resend Email",
                    onPressed: () {
                      _authService.sendEmailVerification();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Verification email sent!')),
                      );
                    },
                    isExpanded: true,
                    borderRadius: 16,
                  ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut(); // Allow user to sign out if they want to use a different email
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel and go back",
                style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}