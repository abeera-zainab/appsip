import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


import '../main.dart'; 
import '../widgets/color_grid.dart';
import '../widgets/photo_upload_widget.dart';

// Import the new screens
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

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() => _selectedImage = File(image.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('MMMM d, yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.textPrimary,
        );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Text(
                      'Edit Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        fontFamily: 'RedHatDisplay'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                PhotoUploadWidget(
                  selectedImage: _selectedImage,
                  onTap: _pickImage,
                ),
                const SizedBox(height: 40),

                RichText(
                  text: TextSpan(
                    style: labelStyle,
                    children: const [
                      TextSpan(text: 'Select Profile Background Color',style: TextStyle(fontFamily: 'RedHatDisplay',fontSize: 14,fontWeight: FontWeight.normal)),
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: AppColors.primaryRed),
                      ),
                    ],
                  ),
                ),
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
                          RichText(
                            text: TextSpan(
                              style: labelStyle,
                              children: [
                                const TextSpan(text: 'First Name',style: TextStyle(fontFamily: 'RedHatDisplay', fontSize: 14, fontWeight:FontWeight.normal)),
                                const TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: AppColors.primaryRed),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: _firstNameController,
                            decoration: const InputDecoration(
                              hintText: 'Type here...' ,
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: AppColors.cardColorsecondary
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: labelStyle,
                              children: const [
                                TextSpan(text: 'Last Name',style: TextStyle(fontFamily: 'RedHatDisplay',fontSize: 14,fontWeight: FontWeight.normal)),
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: AppColors.primaryRed),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: _lastNameController,
                            decoration: const InputDecoration(
                              hintText: 'Type here...',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: AppColors.cardColorsecondary
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                RichText(
                  text: TextSpan(
                    style: labelStyle,
                    children: const [
                      TextSpan(text: 'Email Address' ,style: TextStyle(fontFamily: 'RedHatDisplay',fontSize: 14 )),
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: AppColors.primaryRed),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'example@email.com',
                    icon: SvgPicture.asset('assets/svg/mail.svg',
                  
                    ) ,
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: AppColors.cardColorsecondary
                  ),
                ),
                const SizedBox(height: 24),

                Text('Phone Number', style: labelStyle),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.cardColorsecondary,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Row(
                        children: [
                          Text('🇺🇸', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 8),
                          Icon(Icons.keyboard_arrow_down, color: AppColors.textPrimary),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: '+1 (XXX) XXXX XXX',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: AppColors.cardColorsecondary
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                RichText(
                  text: TextSpan(
                    style: labelStyle,
                    children: const [
                      TextSpan(text: 'Date of Birth'),
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: AppColors.primaryRed),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _dobController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: const InputDecoration(
                    hintText: 'Choose a date --',
                    suffixIcon: Icon(Icons.calendar_today_outlined, color: AppColors.textPrimary),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: AppColors.cardColorsecondary
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.info_outline, color: AppColors.primaryRed, size: 16),
                    SizedBox(width: 8),
                    Text(
                      'Your age must be 21 or above',
                      style: TextStyle(color: AppColors.primaryRed, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // --- CHANGE 1: DELETE ACCOUNT NAVIGATION ---
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    icon: const Icon(Icons.delete_outline, color: AppColors.primaryRed),
                    label: const Text(
                      'Delete Account',
                      style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // Navigate to the Delete Account screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DeleteAccountScreen(),
                        ),
                      );
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
                      child: OutlinedButton.icon(
                        icon: SvgPicture.asset('assets/svg/xmark.svg',
                        width: 24,
                        height: 24),
                        label: const Text('Cancel', style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.normal, fontFamily: 'RedHatDisplay')),
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.cardColorsecondary,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
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
                        child: ElevatedButton.icon(
                          icon: SvgPicture.asset('assets/svg/check.svg',
                          width: 24,
                          height: 24,),
                          label: const Text('Save Changes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'RedHatDisplay')),
                          // --- CHANGE 2: SAVE CHANGES NAVIGATION ---
                          onPressed: () {
                            if (_validateForm()) {
                              // Logic to save data would go here
                              
                              // Navigate to the success screen
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ProfileUpdatedScreen(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
      ),
    );
  }

  bool _validateForm() {
    if (_firstNameController.text.isEmpty || 
        _lastNameController.text.isEmpty || 
        _emailController.text.isEmpty || 
        _dobController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return false;
    }
    
    return true;
  }
}