import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming you have this package
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

// Assuming these files exist in your project structure
import '../main.dart';
import '../widgets/color_grid.dart';
import '../widgets/photo_upload_widget.dart';
import 'delete_account_screen.dart';
import 'profile_updated_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _selectedImage;
  int _selectedColorIndex = 1;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  // --- Helper Methods ---

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() => _selectedImage = File(image.path));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      // You can add builder here to theme the date picker
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('MMMM d, yyyy').format(picked);
      });
    }
  }

  bool _validateForm() {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _dobController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields.')),
      );
      return false;
    }
    // You can add more validation here (e.g., email format)
    return true;
  }
  
  // --- Reusable Widgets & Styles ---

  // Helper to create consistent Text Field decorations
  InputDecoration _buildInputDecoration({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.cardColorsecondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide.none, // Hides the border
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
      ),
    );
  }

  // Helper for creating consistent labels with a required asterisk
  Widget _buildRequiredLabel(String text, TextStyle? style) {
    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: text),
          const TextSpan(
            text: ' *',
            style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const textLabelStyle = TextStyle(
      color: AppColors.textPrimary,
      fontFamily: 'RedHatDisplay',
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/arrow_back.svg', width: 24, height: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            fontFamily: 'RedHatDisplay',
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              PhotoUploadWidget(
                selectedImage: _selectedImage,
                onTap: _pickImage,
              ),
              const SizedBox(height: 40),
              _buildRequiredLabel('Select Profile Background Color', textLabelStyle),
              const SizedBox(height: 16),
              ColorGrid(
                selectedColorIndex: _selectedColorIndex,
                onColorSelected: (index) {
                  setState(() => _selectedColorIndex = index);
                },
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRequiredLabel('First Name', textLabelStyle),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _firstNameController,
                          decoration: _buildInputDecoration(hintText: 'Type here...'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRequiredLabel('Last Name', textLabelStyle),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _lastNameController,
                          decoration: _buildInputDecoration(hintText: 'Type here...'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildRequiredLabel('Email Address', textLabelStyle),
              const SizedBox(height: 12),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _buildInputDecoration(
                  hintText: 'example@email.com',
                  // CORRECTED: Use prefixIcon to place the icon inside the field
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SvgPicture.asset('assets/svg/mail.svg', width: 20, height: 20),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Phone Number', style: textLabelStyle),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    decoration: BoxDecoration(
                      color: AppColors.cardColorsecondary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Text('🇺🇸', style: TextStyle(fontSize: 20)),
                        const SizedBox(width: 8),
                        SvgPicture.asset('assets/svg/vector.svg', width: 20, height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: _buildInputDecoration(hintText: '+1 (XXX) XXXX XXX'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildRequiredLabel('Date of Birth', textLabelStyle),
              const SizedBox(height: 12),
              TextField(
                controller: _dobController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: _buildInputDecoration(
                  hintText: 'Choose a date --',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: SvgPicture.asset('assets/svg/calendar.svg', width: 20, height: 20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/info.svg', width: 16, height: 16),
                  const SizedBox(width: 8),
                  const Text(
                    'Your age must be 21 or above',
                    style: TextStyle(color: AppColors.primaryRed, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  icon: Icon(Icons.delete_outline, color: AppColors.primaryRed) ,
                  label: const Text(
                    'Delete Account',
                    style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DeleteAccountScreen(),
                    ));
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.cardColorsecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: AppColors.cardColorsecondary,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: const Text('Cancel', style: TextStyle(color: AppColors.primaryRed)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF8607E), AppColors.primaryRed],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_validateForm()) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProfileUpdatedScreen(),
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Save Changes', 
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ); // FIXED: Removed extra ')' and added the required semicolon
  }
}