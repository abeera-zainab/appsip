// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:flutter_svg/svg.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String hintText;
  final List<String> items;
  final String? value; // To hold the currently selected value
  final ValueChanged<String?>? onChanged; // To notify the parent of a change
  final Widget? prefixIcon; // To allow any custom icon or widget
  final Color? fillColor; // To allow custom background color

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.prefixIcon,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            // Use the provided color, or default to cardColor
            fillColor: fillColor ?? AppColors.cardColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            // Use the new prefixIcon parameter
            prefixIcon: prefixIcon,
            hintText: hintText,
          ),
          hint: Text(
            hintText,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          icon:  SvgPicture.asset('assets/svg/Vector.svg'),
          dropdownColor: AppColors.cardColor, // Dropdown menu color can stay consistent
          style: const TextStyle(color: AppColors.textPrimary),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          // Use the onChanged callback
          onChanged: onChanged,
        ),
      ],
    );
  }
}