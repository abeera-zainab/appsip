// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:appsip/main.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String hintText;
  final List<String> items;
  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? value;
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
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cardColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          hint: Row(
            children: [
              const Icon(Icons.account_balance, color: AppColors.textSecondary),
              const SizedBox(width: 10),
              Text(
                hintText,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          dropdownColor: AppColors.cardColor,
          style: const TextStyle(color: AppColors.textPrimary),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}