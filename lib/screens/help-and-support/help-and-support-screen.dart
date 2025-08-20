import 'package:appsip/screens/help-and-support/submit-issue-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appsip/main.dart';
// Make sure you have your AppColors defined, for example:
// import 'package:appsip/main.dart';

// --- A helper widget for creating labels with a required asterisk ---
class RequiredLabel extends StatelessWidget {
  final String label;
  const RequiredLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'RedHatDisplay',
          color: AppColors.textPrimary,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: ' *',
            style: TextStyle(
              color: AppColors.primaryRed, // Using your app's primary red color
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'RedHatDisplay',
            ),
          ),
        ],
      ),
    );
  }
}

// --- CustomTextInputField (Updated) ---
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
    this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredLabel(label: label), // Using the new required label widget
        const SizedBox(height: 8), // Reduced space
        field ??
            TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: const TextStyle(color: AppColors.textPrimary,fontSize: 14,fontFamily: 'Red Hat Display',),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: AppColors.textSecondary,fontWeight: FontWeight.normal,fontSize: 16,fontFamily: 'RedHatDisplay'),
                filled: true,
                fillColor: AppColors.cardColorsecondary, 
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
      ],
    );
  }
}

// --- CustomDropdownField (Updated) ---
class CustomDropdownField extends StatefulWidget {
  final String label;
  final String hintText;
  final List<String> items;
  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hintText,
    required this.items,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredLabel(label: widget.label), // Using the new required label widget
        const SizedBox(height: 8), // Reduced space
        DropdownButtonFormField<String>(
          isExpanded: true,
          value: _selectedValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cardColorsecondary, // Unified color
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          hint: Text( // Simplified hint to match screenshot
            widget.hintText,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          icon: SvgPicture.asset('assets/svg/Vector.svg'),
          dropdownColor: Colors.black,
          style: const TextStyle(color: AppColors.textPrimary),
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: AppColors.textPrimary),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },
        ),
      ],
    );
  }
}

// --- HelpAndSupportScreen Widget (Updated) ---
class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final TextEditingController _issueDescriptionController =
      TextEditingController();
  final List<String> _issueTypes = [
    'App Not Working / Crashing',
    'Problem with My Skip Pass',
    'Payment or Billing Issue',
    'Account or Login Issue',
    'Verification or Invite Problem',
    'Can\'t Find My Venue / Bar',
    'Issue Redeeming a Pass',
    'Challenge or Reward Issue',
    'Feature Request or Feedback',
    'Report a Bug or Error',
    'Other / Not Listed',
  ];

  @override
  void dispose() {
    _issueDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          // Assuming you have an SVG asset for the back arrow
          icon: SvgPicture.asset('assets/svg/arrow_back.svg'), 
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Help & Support',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'RedHatDisplay',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Dropdown for Issue Type
              CustomDropdownField(
                label:( 'What type of issue are you facing?') ,
                hintText: 'Select--',
                items: _issueTypes,
              ),
              const SizedBox(height: 18), 

              CustomTextInputField(
                label: 'Describe Your Issue',
                field: TextField(
                  controller: _issueDescriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7, // Adjusted max lines for better look
                  minLines: 7,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Type your issue in detail...',
                    hintStyle: const TextStyle(color: AppColors.textSecondary),
                    filled: true,
                    fillColor: AppColors.cardColorsecondary,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18), 

              // Attachments Section
              const RequiredLabel(label: 'Attachments'),
              const SizedBox(height: 8), 
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                decoration: BoxDecoration(
                  color: AppColors.cardColorsecondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/attachment.svg'),
                    const SizedBox(width: 12),
                    const Text(
                      'Upload a Screenshot or Video--',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontFamily: 'RedHatDisplay',
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/svg/upload.svg'),
                  ],
                ),
              ),
              const SizedBox(height: 24), 

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gradientEndRed,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), 
                    ),
                  ),
                  onPressed: () {
                    // Handle submit action
                     Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SubmitIssueScreen(),
                        ),
                      );
                  },
                  child: const Text(
                    'Submit Issue',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'RedHatDisplay',
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}


