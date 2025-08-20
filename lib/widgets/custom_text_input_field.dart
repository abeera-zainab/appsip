// --- CHANGE: ADDED THIS IMPORT FOR APPCOLORS ---
import 'package:appsip/main.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final String? prefixSvgPath;
  final IconData? suffixIcon;
  final String? suffixSvgPath;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onSuffixIconTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextInputField({
    super.key,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.prefixSvgPath,
    this.suffixIcon,
    this.suffixSvgPath,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.onSuffixIconTap,
    this.keyboardType,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // Helper function to build prefix/suffix icons, now local to this widget
    Widget? buildIcon(String? svgPath, IconData? iconData, {bool isSuffix = false}) {
      Widget? iconWidget;
      const Color iconColor = AppColors.textPrimary;

      if (svgPath != null) {
        iconWidget = SvgPicture.asset(svgPath, width: 22, height: 22, color: iconColor);
      } else if (iconData != null) {
        iconWidget = Icon(iconData, color: iconColor);
      }

      if (iconWidget == null) return null;

      if (isSuffix) {
        // Use an InkWell for a larger tap area and ripple effect
        return InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onSuffixIconTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: iconWidget,
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        child: iconWidget,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  fontFamily: 'RedHatDisplay',
                  color: AppColors.textPrimary, // Ensure text color is visible
                ),
            children: [
              TextSpan(text: label.replaceAll(' *', '')), // The main label text
              if (label.contains(' *'))
                const TextSpan(
                  text: ' *', // The asterisk
                  style: TextStyle(color: AppColors.primaryRed), // This needs the import
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            // This color also needs the import
            fillColor: AppColors.cardColorsecondary, 
            prefixIcon: buildIcon(prefixSvgPath, prefixIcon),
            suffixIcon: buildIcon(suffixSvgPath, suffixIcon, isSuffix: true),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          ),
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
        ),
      ],
    );
  }
}