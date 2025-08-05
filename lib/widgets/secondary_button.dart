// In lib/widgets/secondary_button.dart
import 'package:appsip/main.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isExpanded;
  final Color? backgroundColor; 
  final Color? foregroundColor; 
  final double borderRadius;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isExpanded = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 12.0, // Adjusted to match design
  });

  @override
  Widget build(BuildContext context) {
    // Switched to ElevatedButton for easier background color styling
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0, // No shadow for a flat design
        backgroundColor: backgroundColor ?? AppColors.cardColorsecondary, // Use provided color or default
        foregroundColor: foregroundColor ?? AppColors.primaryRed, // Use provided text color or default
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.normal, fontFamily: 'RedHatDisplay'),
      ),
    );

    if (isExpanded) {
      return Row(children: [Expanded(child: button)]);
    }
    return button;
  }
}