import 'package:flutter/material.dart';
import 'package:appsip/main.dart';

class SwitchProfileScreen extends StatelessWidget {
  const SwitchProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Align(
        alignment: Alignment.bottomCenter,
        child: _SwitchProfileContent(), // Position content at bottom
      ),
    );
  }
}

class _SwitchProfileContent extends StatelessWidget {
  const _SwitchProfileContent({Key? key}) : super(key: key);

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
        mainAxisSize: MainAxisSize.min, // Keep column compact
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
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () {
           Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.cardColorsecondary,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryRed,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.gradientStartRed, AppColors.gradientEndRed],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                // Handle switch profile action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Switch to Customer Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}