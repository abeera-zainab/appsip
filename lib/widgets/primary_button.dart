import 'package:flutter/material.dart';
import 'package:appsip/main.dart'; 

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
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
    required this.onPressed,
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
      padding: padding ?? const EdgeInsets.symmetric(vertical: 18),
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
            // --- FIX: Using the same padding logic as the standard button ---
            // This now correctly respects the padding passed from the screen.
            padding: padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
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