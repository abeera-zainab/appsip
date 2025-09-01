import 'package:flutter/material.dart';

import 'package:appsip/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Made onPressed nullable for disabled state
  final bool isExpanded;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? icon;
  final double borderRadius;

  final LinearGradient? gradient;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed, // Still required, but can be passed as null
    this.isExpanded = false,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.borderRadius = 30.0,
    this.gradient,
    this.boxShadow,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (gradient != null) {
      return _buildGradientButton();
    }
    return _buildStandardButton();
  }

  Widget _buildStandardButton() {
    final style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.gradientEndRed,
      foregroundColor: foregroundColor ?? Colors.white,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 24), // Added horizontal padding for consistency
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      textStyle: textStyle ?? const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
      elevation: 0, // Explicitly remove elevation for consistency
    );

    // Common content for the button (text and optional icon)
    final Widget buttonContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min, // Use min size if not expanded
      children: [
        if (icon != null) ...[
          icon!,
          const SizedBox(width: 10), // Spacing between icon and text
        ],
        Text(text),
      ],
    );

    final Widget button = ElevatedButton(
      onPressed: onPressed, // onPressed can now be null to disable the button
      style: style,
      child: buttonContent, // Use the common button content
    );

    if (isExpanded) {
      return SizedBox( // Use SizedBox to control the width for expanded buttons
        width: double.infinity,
        child: button,
      );
    }
    return button;
  }

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
          onTap: onPressed, // onPressed can now be null
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
            child: buttonContent,
          ),
        ),
      ),
    );

    if (isExpanded) {
      return SizedBox( // Use SizedBox to control the width for expanded buttons
        width: double.infinity,
        child: button,
      );
    }
    return button;
  }
}