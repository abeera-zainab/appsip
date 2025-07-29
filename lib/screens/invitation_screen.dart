import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appsip/main.dart'; // Contains AppColors
import 'package:appsip/screens/register_screen.dart' show RegisterBartenderScreen;
import 'package:appsip/widgets/primary_button.dart';

class InvitationKeyScreen extends StatefulWidget {
  const InvitationKeyScreen({super.key});

  @override
  State<InvitationKeyScreen> createState() => _InvitationKeyScreenState();
}

class _InvitationKeyScreenState extends State<InvitationKeyScreen> {
  final TextEditingController _keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.textPrimary),
        title: const Text(
          "Enter Invitation Key",
          style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              // --- CHANGE IS HERE ---
              // Replaced the custom _buildShieldIcon() with an Image.asset widget.
              // Make sure to replace 'assets/images/your_shield_image.png' with the actual path to your image.
              Center(
                child: Image.asset(
                  'assets/images/shield.png', // <-- REPLACE WITH YOUR IMAGE PATH
                  width: 160,
                  height: 160,
                ),
              ),
              // --- END OF CHANGE ---
              const SizedBox(height: 40),
              Text(
                'Please enter the invitation key you have received from your Bar Venue for verification.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary.withOpacity(0.8),
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                text: const TextSpan(
                  text: 'Enter Invitation Key',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontFamily: 'RedHatDisplay'),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' *',
                        style: TextStyle(color: AppColors.primaryRed, fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _keyController,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'RedHatDisplay',
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Type here..",
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  filled: true,
                  fillColor: AppColors.cardColorsecondary,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // This call now works perfectly because PrimaryButton is updated.
              PrimaryButton(
                text: "Verify",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterBartenderScreen(),
                    ),
                  );
                },
                isExpanded: true,
                borderRadius: 16,
                icon: SvgPicture.asset(
                  'assets/svg/badgecheck.svg',
                  width: 22,
                  height: 22,
                  colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                ),
                gradient: const LinearGradient(
                  // Assuming these colors exist in your AppColors
                  colors: [AppColors.primaryRed, AppColors.primaryRed],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryRed.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- METHOD REMOVED ---
  // The _buildShieldIcon method is no longer needed and has been deleted.
  // --- END OF CHANGE ---
}