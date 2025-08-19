import 'package:appsip/main.dart';
import 'package:appsip/screens/tell_us_about_yourself_screen.dart' show TellUsAboutYourselfScreen;
import 'package:appsip/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:appsip/widgets/custom_text_input_field.dart';
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

  // SVG asset paths
  final String lockIconPath = 'assets/svg/lock.svg';
  final String eyeIconPath = 'assets/svg/eyeopen.svg';
  final String eyeOffIconPath = 'assets/svg/eyeclosed.svg';
  final String flagIconPath = 'assets/svg/flag.svg';
  final String dropdownIconPath = 'assets/svg/vector.svg';
  final String calendarIconPath = 'assets/svg/calendar.svg';
  final String mailIconPath = 'assets/svg/mail.svg';

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
                    child: CustomTextInputField(
                      label: "First Name *",
                      hint: "Type here...",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextInputField(
                      label: "Last Name *",
                      hint: "Type here...",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Email Address
              CustomTextInputField(
                label: "Email Address *",
                hint: "example@email.com",
                prefixSvgPath: mailIconPath,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Phone Number label (simplified without RichText)
              Text(
                "Phone Number ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
              ),
              const SizedBox(height: 8),

              // Phone Number input fields with reduced spacing
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Country Code Picker
                  SizedBox(
                    width: 70, // Reduced width
                    child: TextFormField(
                      readOnly: true,
                      onTap: () { /* TODO: Implement country code picker logic */ },
                      decoration: InputDecoration(
                        
                        filled: true,
                        fillColor: AppColors.cardColorsecondary,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
                          child: SvgPicture.asset(flagIconPath),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
                          child: SvgPicture.asset(dropdownIconPath),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Reduced spacing from 16 to 8
                  // Phone Number Input
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "+1(XXX) XXXX XXX",
                        filled: true,
                        fillColor: AppColors.cardColorsecondary,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Date of Birth
              CustomTextInputField(
                label: "Date of Birth *",
                hint: "Choose a date --",
                prefixSvgPath: calendarIconPath,
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
                  style: TextStyle(color: Theme.of(context).colorScheme.error.withOpacity(0.9), fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              CustomTextInputField(
                label: "Password *",
                hint: "Minimum 8 characters...",
                prefixSvgPath: lockIconPath,
                obscureText: _isPasswordObscured,
                suffixSvgPath: _isPasswordObscured ? eyeIconPath : eyeOffIconPath,
                onSuffixIconTap: () {
                  setState(() {
                    _isPasswordObscured = !_isPasswordObscured;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Confirm Password
              CustomTextInputField(
                label: "Confirm Password *",
                hint: "Minimum 8 characters...",
                prefixSvgPath: lockIconPath,
                obscureText: _isConfirmPasswordObscured,
                suffixSvgPath: _isConfirmPasswordObscured ? eyeIconPath : eyeOffIconPath,
                onSuffixIconTap: () {
                  setState(() {
                    _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                  });
                },
              ),
              const SizedBox(height: 30),

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
                icon: SvgPicture.asset('assets/svg/create-account.svg'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}