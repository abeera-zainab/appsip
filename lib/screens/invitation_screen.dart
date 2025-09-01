import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:appsip/screens/auth/register_screen.dart' show RegisterBartenderScreen;
import 'package:appsip/widgets/primary_button.dart';
// --- CHANGE: Import the custom text field widget ---
import 'package:appsip/widgets/custom_text_input_field.dart';
import 'package:appsip/theme/app_colors.dart';

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
      appBar: AppBar(
        leading: const BackButton(color: AppColors.textPrimary),
        title: const Text(
          "Enter Invitation Key",
          style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontFamily: 'RedHatDisplay'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Image.asset(
                  'assets/images/shield.png',
                  width: 160,
                  height: 160,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Please enter the invitation key you have received from your Bar Venue for verification.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              
              CustomTextInputField(
                label: 'Enter Invitation Key *',
                hint: 'Type here..',
                controller: _keyController,
              ),
              const SizedBox(height: 30),

              PrimaryButton(
                text: "Verify",
                isExpanded: true,
                borderRadius: 16,
                
                icon: SvgPicture.asset(
                  'assets/svg/badgecheck.svg',
                  
                ),
              
               
                
               
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterBartenderScreen(),
                    ),
                  );
               
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}