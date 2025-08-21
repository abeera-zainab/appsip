import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:appsip/screens/delete-account/account_deletion_scheduled.dart';
// Import your custom button widgets
import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/secondary_button.dart';
import 'package:appsip/theme/app_colors.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Delete Account',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RedHatDisplay',
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Please confirm your password to delete your account. Your account will be scheduled to be deleted after 30 days from this date.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary, 
                  fontSize: 14,
                  height: 1.5,
                  fontFamily: 'RedHatDisplay',
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontFamily: 'RedHatDisplay',
                    ),
                    children: [
                      TextSpan(text: 'Confirm Password'),
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: AppColors.primaryRed),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:AppColors.cardColorsecondary, 
                  hintText: 'Minimum 8 characters...',
                  hintStyle: const TextStyle(color: AppColors.textSecondary,fontFamily:'RedHatDisplay',fontSize:  16,fontWeight:FontWeight.normal),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0), 
                    child: SvgPicture.asset('assets/svg/lock.svg',
                    width: 24,
                    height: 24,),
                  ),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      _isPasswordVisible
                          ? 'assets/svg/eyeopen.svg' // Assuming these are the correct asset names
                          : 'assets/svg/eyeclosed.svg', 
                      colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                      height: 24,
                      width: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
              const SizedBox(height: 20),
              
              // --- BUTTONS REPLACED WITH WIDGETS ---
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      text: 'Cancel',
                      onPressed: () => Navigator.of(context).pop(),
                      borderRadius: 16.0,
                      // Override the default text color to match the original design
                      foregroundColor: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      text: 'Delete Account',
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const AccountDeletionScheduledScreen(),
                          ),
                        );
                      },
                      borderRadius: 16.0,
                     
                      // Override padding and text style to match the original design
                      padding: const EdgeInsets.symmetric(vertical: 18),
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}