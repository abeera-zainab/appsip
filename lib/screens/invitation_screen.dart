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

  void _onKeyPressed(String value) {
    if (value == 'backspace') {
      if (_keyController.text.isNotEmpty) {
        _keyController.text =
            _keyController.text.substring(0, _keyController.text.length - 1);
      }
    } else {
      _keyController.text += value;
    }
    setState(() {}); // To rebuild and reflect changes if needed
  }

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
            NumericKeypad(onKeyPressed: _onKeyPressed),
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

// --- UPDATED WIDGET ---
// Custom Numeric Keypad Widget with Alphabetic Characters
class NumericKeypad extends StatelessWidget {
  final Function(String) onKeyPressed;

  const NumericKeypad({super.key, required this.onKeyPressed});

  // Map for letters on the keypad, matching the design
  static const Map<String, String> _keypadLetters = {
    '2': 'ABC',
    '3': 'DEF',
    '4': 'GHI',
    '5': 'JKL',
    '6': 'MNO',
    '7': 'PQRS',
    '8': 'TUV',
    '9': 'WXYZ',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.background,
      child: Column(
        children: [
          _buildKeyRow(['1', '2', '3'], context),
          const SizedBox(height: 15),
          _buildKeyRow(['4', '5', '6'], context),
          const SizedBox(height: 15),
          _buildKeyRow(['7', '8', '9'], context),
          const SizedBox(height: 15),
          _buildKeyRow(['+*#', '0', 'backspace'], context),
        ],
      ),
    );
  }

  // Helper to build a row of keys
  Widget _buildKeyRow(List<String> keys, BuildContext context) {
    return Row(
      children: keys.map((key) => Expanded(child: _buildKey(key, context))).toList(),
    );
  }

  // Helper to build an individual key
  Widget _buildKey(String key, BuildContext context) {
    final letters = _keypadLetters[key];
    final isBackspace = key == 'backspace';
    final isSymbolKey = key == '+*#';

    return InkWell(
      onTap: () {
        // The symbol key is for display only and won't trigger an action
        if (!isSymbolKey) {
          onKeyPressed(key);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2D37),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: isBackspace
              ? const Icon(Icons.backspace_outlined, color: Colors.white, size: 24)
              : isSymbolKey
                  ? Text(key, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          key,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        // SizedBox for consistent height
                        SizedBox(
                          height: 15,
                          child: letters != null
                              ? Text(
                                  letters,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2, // Adds space between letters
                                    color: Colors.white70,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}