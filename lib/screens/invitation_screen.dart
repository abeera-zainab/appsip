// screens/invitation_key_screen.dart

// ignore_for_file: deprecated_member_use

import 'package:appsip/main.dart';
import 'package:appsip/screens/register_screen.dart' show RegisterBartenderScreen;

import 'package:appsip/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class InvitationKeyScreen extends StatefulWidget {
  const InvitationKeyScreen({super.key});

  @override
  State<InvitationKeyScreen> createState() => _InvitationKeyScreenState();
}

class _InvitationKeyScreenState extends State<InvitationKeyScreen> {
  final TextEditingController _keyController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Invitation Key"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    _buildShieldIcon(),
                    const SizedBox(height: 30),
                    Text(
                      'Please enter the invitation key you have received from your Bar Venue for verification.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textSecondary.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      controller: _keyController,
                      textAlign: TextAlign.center,
                      readOnly: true,
                      showCursor: true,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        hintText: "Type here...",
                        filled: true,
                        fillColor: AppColors.cardColorsecondary
                      ),
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      text: "Verify",
                      onPressed: () {
                        // Navigate to the Register screen on successful verification
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterBartenderScreen()),
                        );
                      },
                      isExpanded: true,
                      borderRadius: 16,
                      icon: const Icon(Icons.check_circle_outline, size: 20),
                    ),
                  ],
                ),
              ),
            ),
            // Updated Keypad
           
          ],
        ),
      ),
    );
  }

  Widget _buildShieldIcon() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.gradientEnd.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
      ),
      // The shield icon is complex. Using a simpler checkmark icon in a circle.
      // For a perfect match, an SVG or custom painter would be needed.
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 70,
      ),
    );
  }
}

