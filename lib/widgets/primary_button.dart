// In lib/widgets/primary_button.dart

import 'package:appsip/main.dart'; // For AppColors
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isExpanded;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? icon;
  final double borderRadius;
  
  // --- NEW: Optional parameters for advanced styling ---
  final LinearGradient? gradient;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isExpanded = false,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.borderRadius = 30.0,
    // --- These are optional, so existing calls won't error ---
    this.gradient,
    this.boxShadow,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // --- CHECK: If a gradient is provided, build a custom button ---
    if (gradient != null) {
      return _buildGradientButton();
    }
    
    // --- FALLBACK: Otherwise, build the original ElevatedButton ---
    return _buildStandardButton();
  }

  /// Builds the original button based on ElevatedButton.
  /// This ensures backward compatibility for all other screens.
  Widget _buildStandardButton() {
    final style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.primaryRed,
      foregroundColor: foregroundColor ?? Colors.white,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      textStyle: textStyle ?? const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
    );

    final Widget button = (icon != null)
        ? ElevatedButton.icon(
            onPressed: onPressed,
            style: style,
            icon: icon!,
            label: Text(text),
          )
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

  /// Builds the new, advanced button with gradient and shadow.
  Widget _buildGradientButton() {
    final buttonContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[icon!, const SizedBox(width: 10)],
        Text(
          text,
          style: textStyle ?? const TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 16),
        ),
      ],
    );

    final button = Container(
      decoration: BoxDecoration(
        gradient: gradient!,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: buttonContent,
          ),
        ),
      ),
    );

    if (isExpanded) {
      return Row(children: [Expanded(child: button)]);
    }
    return button;
  }
}