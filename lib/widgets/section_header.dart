import 'package:appsip/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final TextStyle? titleStyle;

  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.textPrimary,fontFamily: 'RedHatDisplay')),
        if (trailing != null) trailing!,
      ],
    );
  }
}