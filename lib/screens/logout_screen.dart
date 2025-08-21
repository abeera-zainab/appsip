import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
// Assuming your widgets are in a 'widgets' folder
import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/secondary_button.dart';


class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          // Dialog at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: LogoutConfirmationDialog(),
          ),
        ],
      ),
    );
  }
}

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // --- CHANGE START: Adjusting container to match SwitchProfileScreen ---
    return Container(
      width: double.infinity, // Take full width
      // Using fromLTRB to match SwitchProfileScreen's padding exactly
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40), 
      decoration: const BoxDecoration(
        color: AppColors.background,
        // Only rounding the top corners to create a "docked" bottom sheet look
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
      ),
      // --- CHANGE END ---
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          Image.asset(
            'assets/images/logout.png', 
            height: 160,
            width: 160,
          ),
          const SizedBox(height: 24),
          // Confirmation text
          const Text(
            'Are you sure you want to logout your account?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold, // Medium weight
            ),
          ),
          const SizedBox(height: 40),
          // Action buttons
          Row(
            children: [
              
              Expanded(
                child: SecondaryButton(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  foregroundColor: AppColors.textSecondary,
                  borderRadius: 16, 
                ),
              ),
              const SizedBox(width: 16),
             
              Expanded(
                child: PrimaryButton(
                  text: 'Logout',
                  onPressed: () {
                    print("Logout pressed");
                  },
                  borderRadius: 16, 
                  // Matching the vertical padding of the profile swap screen's primary button
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}