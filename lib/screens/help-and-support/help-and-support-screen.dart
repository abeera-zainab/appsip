import 'package:appsip/screens/help-and-support/submit-issue-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appsip/main.dart';
// Import your custom widgets
import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/custom_dropdown_field.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final TextEditingController _issueDescriptionController = TextEditingController();
  String? _selectedIssueType; // State for the selected dropdown value

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
      appBar: AppBar(
        leading: IconButton(
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
              // --- Refactored Widgets ---
              _IssueTypeDropdown(
                items: _issueTypes,
                value: _selectedIssueType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedIssueType = newValue;
                  });
                },
              ),
              const SizedBox(height: 18),
              _IssueDescriptionField(controller: _issueDescriptionController),
              const SizedBox(height: 18),
              const _AttachmentsSection(),
              const SizedBox(height: 24),
              _SubmitIssueButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SubmitIssueScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// --- A helper widget for creating labels with a required asterisk ---
class _RequiredLabel extends StatelessWidget {
  final String label;
  const _RequiredLabel({required this.label});

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
              color: AppColors.primaryRed,
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

// --- Widget for the Issue Type Dropdown ---
class _IssueTypeDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  const _IssueTypeDropdown({
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Note: The global CustomDropdownField has its own label style.
    // To perfectly match, we adjust here or update the global widget.
    return CustomDropdownField(
      label: 'What type of issue are you facing? *',
      hintText: 'Select--',
      items: items,
      value: value,
      onChanged: onChanged,
      fillColor: AppColors.cardColorsecondary, // Matching original screen color
    );
  }
}

// --- Widget for the Issue Description Text Area ---
class _IssueDescriptionField extends StatelessWidget {
  final TextEditingController controller;
  const _IssueDescriptionField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RequiredLabel(label: 'Describe Your Issue'),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 7,
          minLines: 7,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: 'Type your issue in detail...',
            hintStyle: const TextStyle(color: AppColors.textSecondary),
            filled: true,
            fillColor: AppColors.cardColorsecondary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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

// --- Widget for the Attachments Section ---
class _AttachmentsSection extends StatelessWidget {
  const _AttachmentsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RequiredLabel(label: 'Attachments'),
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
      ],
    );
  }
}

// --- Widget for the Submit Button ---
class _SubmitIssueButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _SubmitIssueButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      isExpanded: true, // Makes the button take full width
      text: 'Submit Issue',
      onPressed: onPressed,
      backgroundColor: AppColors.gradientEndRed,
      borderRadius: 30,
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: 'RedHatDisplay',
      ),
    );
  }
}