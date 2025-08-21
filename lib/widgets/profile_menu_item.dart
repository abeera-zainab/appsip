import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:appsip/theme/app_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final VoidCallback onTap;
  final String? trailingText;
  final Color? customColor;

  const ProfileMenuItem({
    super.key,
    required this.svgIconPath,
    required this.title,
    required this.onTap,
    this.trailingText,
    this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = customColor ?? AppColors.textPrimary;

    return Padding(
     
      padding: const EdgeInsets.only(bottom: 4.0), // Was 8.0
      child: Material(
        color: AppColors.cardColorsecondary,
        
        borderRadius: BorderRadius.circular(16), // Was 16
        child: InkWell(
          borderRadius: BorderRadius.circular(16), // Was 16
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                const SizedBox(width: 20), // Slightly increased for better spacing
                SvgPicture.asset(
                  svgIconPath,
                  // --- CHANGE 4: Slightly larger icon. ---
                  width: 24, // Was 24
                  height: 24, // Was 24
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                const SizedBox(width: 24), // Adjusted this from 40 for a more standard look
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontFamily: 'RedHatDisplay',
                      // --- CHANGE 5: Slightly larger font size. ---
                      fontSize: 16, // Was 16
                      fontWeight: FontWeight.w500, // Changed to w500 for a bit more emphasis
                    ),
                  ),
                ),
                if (trailingText != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      trailingText!,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                SvgPicture.asset(
                  'assets/svg/nav-arrow-right.svg', // Assuming this is your arrow icon
                  colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn), // Applied colorFilter
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 20), // Matched the leading SizedBox
              ],
            ),
          ),
        ),
      ),
    );
  }
}