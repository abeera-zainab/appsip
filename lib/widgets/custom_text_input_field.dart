import 'package:flutter/material.dart';

class CustomTextInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? field;

  const CustomTextInputField({
    super.key,
    required this.label,
    this.hint = '',
    this.keyboardType,
    this.controller,
    this.field, required fillColor, required bool filled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal,fontFamily: 'RedHatDisplay')),
        const SizedBox(height: 12),
        field ??
            TextField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hint,
                
              ),
            ),
      ],
    );
  }
}