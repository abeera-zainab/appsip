import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Assuming your AppColors and next screen are located here
import 'package:appsip/main.dart'; 
import 'package:appsip/screens/account_deletion_scheduled.dart';

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
    // A constant for the button shape to avoid repetition
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // --- FIX 1: Changed alignment to start for correct layout ---
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Text(
                'Please confirm your password to delete your account. Your account will be scheduled to be deleted after 30 days from this date.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // Used primary text color with opacity to match design
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

                  hintStyle: TextStyle(color: AppColors.textSecondary,fontFamily:'RedHatDisplay',fontSize:  16,fontWeight:FontWeight.normal),
                 
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0), 
                    child: SvgPicture.asset('assets/svg/lock.svg',
                    width: 24,
                    height: 24,),
                  ),
              
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      _isPasswordVisible
                          ? 'assets/svg/eyeopen.svg'
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
              
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cardColorsecondary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: buttonShape,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                         
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: 'RedHatDisplay',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const AccountDeletionScheduledScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: buttonShape,
                      ),
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontFamily: 'RedHatDisplay',
                        ),
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