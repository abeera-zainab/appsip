import 'package:flutter/material.dart';

import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/secondary_button.dart';
import 'package:appsip/theme/app_colors.dart';
class SwitchProfileScreen extends StatelessWidget {
  const SwitchProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: _SwitchProfileContent(), // Position content at bottom
      ),
    );
  }
}

class _SwitchProfileContent extends StatelessWidget {
  const _SwitchProfileContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Take full width
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40), // Increased top padding
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/Profile-swap.png',
            height: 160,
            width: 160,
          ),
          const SizedBox(height: 24),
          const Text(
            'Are you sure you want to switch your account to Customer Profile?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          // --- MODIFICATION START ---
          // The action buttons are now directly in the build method
          Row(
            children: [
              Expanded(
                flex: 2,
                child: SecondaryButton(
                  text: ('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  isExpanded: true,
                  backgroundColor: AppColors.cardColorsecondary,
                  foregroundColor: AppColors.textSecondary,
                   // Corrected color for better visibility
                  borderRadius: 16.0,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 5,
                child: PrimaryButton(
                  text: 'Switch to Customer Profile',
                  onPressed: () {
                    // Handle switch profile action
                  },
                  isExpanded: true,
                 
                  borderRadius: 16.0,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
    
        ],
      ),
    );
  }
  
}