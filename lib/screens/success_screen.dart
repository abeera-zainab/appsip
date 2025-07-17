import 'dart:async'; // Import the async library for Timer

import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:appsip/screens/main_screen_shell.dart';


class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start a timer to navigate after a delay
    _timer = Timer(const Duration(seconds: 3), () {
      // Use pushReplacement to prevent the user from going back to the success screen
      if (mounted) { // Check if the widget is still in the tree
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreenShell()),
        );
      }
    });
  }

  @override
  void dispose() {
    // It's important to cancel the timer when the widget is disposed
    // to prevent memory leaks and errors.
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- Custom Checkmark Icon ---
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.gradientStart, AppColors.gradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 70,
                ),
              ),
              const SizedBox(height: 40),

              // --- Title Text ---
              const Text(
                "All Set, You're In!",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // --- Description Text ---
              const Text(
                'Welcome to the SipSkip team at [Venue Name].\nYou’re all set to start redeeming Skip Passes and earning rewards.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}