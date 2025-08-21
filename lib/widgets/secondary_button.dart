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
  final Widget? icon; // <-- ADDED: Optional icon parameter

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isExpanded = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 12.0,
    this.icon, // <-- ADDED: In constructor
  });

  @override
  Widget build(BuildContext context) {
    // Define the style once to be used by both button types
    final style = ElevatedButton.styleFrom(
      elevation: 0, // No shadow for a flat design
      backgroundColor: backgroundColor ?? AppColors.cardColorsecondary,
      foregroundColor: foregroundColor ?? AppColors.primaryRed,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      // Set the text style directly in the button style
      textStyle: const TextStyle(
        fontWeight: FontWeight.normal, 
        fontFamily: 'RedHatDisplay',
        fontSize: 16, // Explicitly setting font size for consistency
      ),
    );

    // --- MODIFICATION: Conditionally create the button based on the icon's presence ---
    final button = (icon != null)
        // If an icon is provided, use ElevatedButton.icon
        ? ElevatedButton.icon(
            onPressed: onPressed,
            style: style,
            icon: icon!,
            label: Text(text),
          )
        // Otherwise, use the standard ElevatedButton
        : ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: Text(text),
          );

    if (isExpanded) {
      return Row(children: [Expanded(child: button)]);
    }
    return button;
  }
}