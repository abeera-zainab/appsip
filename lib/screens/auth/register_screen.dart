import 'package:appsip/screens/auth/verify_email.dart'; // Corrected import path
import 'package:appsip/services/firebase_auth_service.dart'; // Import the service
import 'package:appsip/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:appsip/widgets/custom_text_input_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appsip/theme/app_colors.dart';

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

  // Controllers for new fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController(); // Added
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FirebaseAuthService _authService = FirebaseAuthService(); // Instantiate the service
  bool _isLoading = false; // To show loading state

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
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await _authService.registerWithEmailAndPassword(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const VerifyEmailScreen()),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString().replaceFirst('Exception: ', ''))),
          );
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
                      controller: _firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextInputField(
                      label: "Last Name *",
                      hint: "Type here...",
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
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
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Phone Number label
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                  children: const <TextSpan>[
                    TextSpan(text: 'Phone Number '),
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Phone Number input fields with reduced spacing
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Country Code Picker
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        /* TODO: Implement country code picker logic */
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Country code picker not implemented yet.')),
                        );
                      },
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
                  const SizedBox(width: 5), // Reduced spacing from 16 to 8
                  // Phone Number Input
                  Expanded(
                    child: TextFormField(
                      controller: _phoneNumberController, // Added controller
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
                        if (!RegExp(r'^\+?[0-9]{10,14}$').hasMatch(value)) { // Basic phone number validation
                          return 'Please enter a valid phone number';
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please choose your date of birth';
                  }
                  // Basic age validation (21 years old)
                  try {
                    final parts = value.split('/');
                    if (parts.length == 3) {
                      final day = int.parse(parts[0]);
                      final month = int.parse(parts[1]);
                      final year = int.parse(parts[2]);
                      final dob = DateTime(year, month, day);
                      final today = DateTime.now();
                      final age = today.year - dob.year;
                      if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
                        // If birthday hasn't occurred yet this year
                        if (age - 1 < 21) {
                          return 'You must be 21 or above';
                        }
                      } else {
                        if (age < 21) {
                          return 'You must be 21 or above';
                        }
                      }
                    }
                  } catch (e) {
                    return 'Invalid date format';
                  }
                  return null;
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
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
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
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Create Account Button
              PrimaryButton(
                text: _isLoading ? "Creating Account..." : "Create Account",
                onPressed: _isLoading ? null : _registerUser, // Disable button while loading
                isExpanded: true,
                borderRadius: 16,
                icon: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : SvgPicture.asset('assets/svg/create-account.svg'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}