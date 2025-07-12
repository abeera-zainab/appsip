import 'package:appsip/main.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isExpanded;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? icon;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isExpanded = false,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.borderRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.primaryRed,
      foregroundColor: foregroundColor ?? Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
    );

    final Widget button = (icon != null)
        ? ElevatedButton.icon(
            onPressed: onPressed,
            style: style,
            icon: icon!,
            label: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
          );

    if (isExpanded) {
      return Row(children: [Expanded(child: button)]);
    }
    return button;
  }
}