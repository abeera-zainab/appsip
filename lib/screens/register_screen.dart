import 'package:appsip/main.dart';
import 'package:appsip/screens/tell_us_about_yourself_screen.dart' show TellUsAboutYourselfScreen;
import 'package:appsip/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:appsip/screens/register_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';

class RegisterBartenderScreen extends StatefulWidget {
  const RegisterBartenderScreen({super.key});

  @override
  State<RegisterBartenderScreen> createState() => _RegisterBartenderScreenState();
}

class _RegisterBartenderScreenState extends State<RegisterBartenderScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  final TextEditingController _dateOfBirthController = TextEditingController();

  // Define SVG asset paths
  final String lockIconPath = 'assets/svg/lock.svg';
  final String eyeIconPath = 'assets/svg/eyeopen.svg';
  final String eyeOffIconPath = 'assets/svg/eyeclosed.svg';

  @override
  void dispose() {
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register as Bartender"),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Name and Last Name
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(label: "First Name *", hint: "Type here..."),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(label: "Last Name *", hint: "Type here..."),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Email Address
              _buildTextField(
                label: "Email Address *",
                hint: "example@email.com",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),

              // Phone Number
              _buildTextField(
                label: "Phone Number",
                hint: "+1 (XXX) XXXX XXX",
                prefixIcon: Icons.flag_circle_outlined,
              ),
              const SizedBox(height: 20),

              // Date of Birth
              _buildTextField(
                label: "Date of Birth *",
                hint: "Choose a date --",
                suffixIcon: Icons.calendar_today_outlined,
                readOnly: true,
                controller: _dateOfBirthController,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context, initialDate: DateTime(2002), firstDate: DateTime(1950), lastDate: DateTime.now());
                  if (pickedDate != null) {
                    _dateOfBirthController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                child: Text(
                  "Your age must be 21 or above",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error.withOpacity(0.9), fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              _buildTextField(
                label: "Password *",
                hint: "Minimum 8 characters...",
                prefixSvgPath: lockIconPath,
                obscureText: _isPasswordObscured,
                suffixSvgPath: _isPasswordObscured ? eyeIconPath : eyeIconPath,
                onSuffixIconTap: () {
                  setState(() {
                    _isPasswordObscured = !_isPasswordObscured;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Confirm Password
              _buildTextField(
                label: "Confirm Password *",
                hint: "Minimum 8 characters...",
                prefixSvgPath: lockIconPath,
                obscureText: _isConfirmPasswordObscured,
                suffixSvgPath: _isConfirmPasswordObscured ? eyeOffIconPath : eyeIconPath,
                onSuffixIconTap: () {
                  setState(() {
                    _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                  });
                },
              ),
              const SizedBox(height: 40),

              // Create Account Button
              PrimaryButton(
                text: "Create Account",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TellUsAboutYourselfScreen()));
                  }
                },
                isExpanded: true,
                borderRadius: 16,
                icon: const Icon(Icons.add_circle_outline, size: 20),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? prefixIcon,
    String? prefixSvgPath,
    IconData? suffixIcon,
    String? suffixSvgPath,
    bool obscureText = false,
    bool readOnly = false,
    VoidCallback? onTap,
    VoidCallback? onSuffixIconTap,
    TextInputType? keyboardType,
    TextEditingController? controller,
  }) {
    Widget? buildIcon(String? svgPath, IconData? iconData, {bool isSuffix = false}) {
      Widget? iconWidget;
      // --- THE FIX IS HERE ---
      // Changed from Colors.white to a neutral gray that is visible on most backgrounds.
      // You can also use a more specific color like Colors.black or a dark theme color.
      final Color iconColor = Colors.grey.shade600;

     if (svgPath != null) {
  iconWidget = SvgPicture.asset(
    svgPath,
    width: 22,
    height: 22,
    color: iconColor, // Directly use color parameter instead of ColorFilter
  );
} else if (iconData != null) {
  iconWidget = Icon(iconData, color: iconColor);
}

      if (iconWidget == null) return null;

      if (isSuffix) {
        return IconButton(
          icon: iconWidget,
          onPressed: onSuffixIconTap,
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
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
            fillColor: AppColors.cardColorsecondary,
            prefixIcon: buildIcon(prefixSvgPath, prefixIcon),
            suffixIcon: buildIcon(suffixSvgPath, suffixIcon, isSuffix: true),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
          validator: (value) {
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