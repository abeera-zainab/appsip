import 'package:flutter/material.dart';
import 'package:appsip/main.dart'; // Imports AppColors

class ProfileHeaderCard extends StatelessWidget {
  final String avatarImagePath;
  final String name;
  final String venueName;

  const ProfileHeaderCard({
    super.key,
    required this.avatarImagePath,
    required this.name,
    required this.venueName,
  });

  @override
  Widget build(BuildContext context) {
    // Colors for the gradient defined in main.dart
    const Color lightPurple = AppColors.profileCardGradientStart;
    const Color darkPurple = AppColors.profileCardGradientEnd;
    
    // Create a list of alternating colors to form the rays
    final List<Color> gradientColors = List.generate(
      48, // More segments create more, thinner rays
      (index) => index.isEven ? lightPurple : darkPurple,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        // The SweepGradient creates the sunburst effect
        gradient: SweepGradient(
          center: Alignment.center,
          colors: gradientColors,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4), // This creates the white border
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(avatarImagePath),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            venueName,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}