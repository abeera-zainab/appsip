// screens/register_bartender_screen.dart

import 'package:appsip/main.dart';
import 'package:appsip/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RegisterBartenderScreen extends StatefulWidget {
  const RegisterBartenderScreen({super.key});

  @override
  State<RegisterBartenderScreen> createState() => _RegisterBartenderScreenState();
}

class _RegisterBartenderScreenState extends State<RegisterBartenderScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register as Bartender"),
        backgroundColor: Colors.transparent,
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
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Phone Number
              _buildTextField(
                label: "Phone Number",
                hint: "+1 (XXX) XXXX XXX",
                prefixIcon: Icons.flag_circle_outlined, // Placeholder for flag
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // Date of Birth
              _buildTextField(
                label: "Date of Birth *",
                hint: "Choose a date --",
                suffixIcon: Icons.calendar_today_outlined,
                readOnly: true,
                onTap: () async {
                  // Implement date picker logic
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime(2002),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                child: Text(
                  "Your age must be 21 or above",
                  style: TextStyle(
                    // ignore: deprecated_member_use
                    color: AppColors.pendingYellow.withOpacity(0.9),
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              _buildTextField(
                label: "Password *",
                hint: "Minimum 8 characters...",
                prefixIcon: Icons.lock_outline,
                obscureText: _isPasswordObscured,
                suffixIcon: _isPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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
                prefixIcon: Icons.lock_outline,
                obscureText: _isConfirmPasswordObscured,
                suffixIcon: _isConfirmPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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
                    // Handle registration logic
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
    IconData? suffixIcon,
    bool obscureText = false,
    bool readOnly = false,
    VoidCallback? onTap,
    VoidCallback? onSuffixIconTap,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: readOnly,
          onTap: onTap,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: onSuffixIconTap,
                  )
                : null,
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