import 'package:appsip/main.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isExpanded;
  final Color? color;
  final double borderRadius;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isExpanded = false,
    this.color,
    this.borderRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: color ?? AppColors.primaryRed),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      ),
      child: Text(text, style: TextStyle(color: color ?? AppColors.primaryRed, fontWeight: FontWeight.bold)),
    );

    if (isExpanded) {
      return Row(children: [Expanded(child: button)]);
    }
    return button;
  }
}