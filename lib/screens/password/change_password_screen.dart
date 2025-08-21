import 'package:appsip/screens/password/change_password_updatescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


// Import your custom button widgets
import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/secondary_button.dart';
import 'package:appsip/theme/app_colors.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Controllers for each text field
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // State for visibility of each password field
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/arrow_back.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'RedHatDisplay',
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      
                      PasswordInputField(
                        label: 'Current Password',
                        controller: _currentPasswordController,
                        isVisible: _isCurrentPasswordVisible,
                        onVisibilityToggle: () {
                          setState(() => _isCurrentPasswordVisible = !_isCurrentPasswordVisible);
                        },
                      ),
                      const SizedBox(height: 10),

                      PasswordInputField(
                        label: 'New Password',
                        controller: _newPasswordController,
                        isVisible: _isNewPasswordVisible,
                        onVisibilityToggle: () {
                          setState(() => _isNewPasswordVisible = !_isNewPasswordVisible);
                        },
                      ),
                      const SizedBox(height: 10),

                      PasswordInputField(
                        label: 'Confirm New Password',
                        controller: _confirmPasswordController,
                        isVisible: _isConfirmPasswordVisible,
                        onVisibilityToggle: () {
                          setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        icon: SvgPicture.asset(
                          'assets/svg/xmark.svg',
                          colorFilter: const ColorFilter.mode(AppColors.primaryRed, BlendMode.srcIn),
                        ),
                        text: 'Cancel',
                        onPressed: () => Navigator.of(context).pop(),
                        foregroundColor: AppColors.gradientEndRed, 
                        borderRadius: 16.0,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: PrimaryButton(
                        text: 'Change Password',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ChangePasswordUpdatescreen(),
                            ),
                          );
                        },
                        borderRadius: 16.0,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        gradient: const LinearGradient(
                          colors: [AppColors.primaryRed, AppColors.gradientEndRed],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        textStyle: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: 'RedHatDisplay',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PasswordInputField class remains unchanged...
class PasswordInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isVisible;
  final VoidCallback onVisibilityToggle;

  const PasswordInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.isVisible,
    required this.onVisibilityToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontFamily: 'RedHatDisplay',
            ),
            children: [
              TextSpan(text: label),
              const TextSpan(
                text: ' *',
                style: TextStyle(color: AppColors.primaryRed),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: !isVisible,
          style: const TextStyle(color: AppColors.textPrimary, fontFamily: 'RedHatDisplay'),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cardColorsecondary,
            hintText: 'Minimum 8 characters...',
            hintStyle: const TextStyle(
              color: AppColors.textSecondary,
              fontFamily: 'RedHatDisplay',
              fontSize: 16,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset('assets/svg/lock.svg'),
            ),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                isVisible
                    ? 'assets/svg/eye-open.svg'
                    : 'assets/svg/eye-closed.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.textPrimary, BlendMode.srcIn),
              ),
              onPressed: onVisibilityToggle,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
          ),
        ),
      ],
    );
  }
}