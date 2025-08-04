import 'package:appsip/screens/change_password_updatescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appsip/main.dart';


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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor:AppColors.background,
        elevation: 0,
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
                      
                      // Current Password Field
                      _buildPasswordSection(
                        label: 'Current Password',
                        controller: _currentPasswordController,
                        isVisible: _isCurrentPasswordVisible,
                        onVisibilityToggle: () {
                          setState(() => _isCurrentPasswordVisible = !_isCurrentPasswordVisible);
                        },
                      ),
                      const SizedBox(height: 24),

                      // New Password Field
                      _buildPasswordSection(
                        label: 'New Password',
                        controller: _newPasswordController,
                        isVisible: _isNewPasswordVisible,
                        onVisibilityToggle: () {
                          setState(() => _isNewPasswordVisible = !_isNewPasswordVisible);
                        },
                      ),
                      const SizedBox(height: 24),

                      // Confirm New Password Field
                      _buildPasswordSection(
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
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  /// A reusable widget method to build each password input section.
  Widget _buildPasswordSection({
    required String label,
    required TextEditingController controller,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with a red asterisk using RichText
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
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          obscureText: !isVisible,
          style: const TextStyle(color: AppColors.textPrimary, fontFamily: 'RedHatDisplay'),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cardColorsecondary,
            hintText: 'Minimum 8 characters...',
            hintStyle: TextStyle(
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

  /// Builds the bottom action buttons for the screen.
  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: SvgPicture.asset(
                'assets/svg/xmark.svg',
                colorFilter: const ColorFilter.mode(AppColors.primaryRed, BlendMode.srcIn),
              ),
              label: const Text(
                'Cancel',
                style: TextStyle(
                    color: AppColors.primaryRed,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'RedHatDisplay'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cardColorsecondary,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                 gradient: const LinearGradient(
                  colors: [AppColors.primaryRed, AppColors.gradientEndRed],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add validation and password change logic here
                 Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChangePasswordUpdatescreen(),
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.normal,
                       fontSize:16 ,
                      fontFamily: 'RedHatDisplay'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}