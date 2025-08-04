import 'package:flutter/material.dart';
import 'package:appsip/main.dart';



class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
        
          // Dialog at the bottom
          const Align(
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
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(28),
      ),
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
          Text(
            'Are you sure you want to logout your account?',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold, // Medium weight
            ),
          ),
          const SizedBox(height: 40),
          // Action buttons
          Row(
            children: [
              // Cancel Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cardColorsecondary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.normal, // Bold weight
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Logout Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    print("Logout pressed");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gradientEndRed,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.normal, 
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}