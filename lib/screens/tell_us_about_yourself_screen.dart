// ignore_for_file: avoid_print

import 'dart:io';
import 'package:appsip/screens/edit_bank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

// Import your widgets and colors
import 'package:appsip/main.dart';
import 'package:appsip/widgets/photo_upload_widget.dart';
import 'package:appsip/widgets/color_grid.dart';
// Import the PrimaryButton widget
import 'package:appsip/widgets/primary_button.dart';

class TellUsAboutYourselfScreen extends StatefulWidget {
  const TellUsAboutYourselfScreen({super.key});

  @override
  State<TellUsAboutYourselfScreen> createState() =>
      _TellUsAboutYourselfScreenState();
}

class _TellUsAboutYourselfScreenState
    extends State<TellUsAboutYourselfScreen> {
  File? _selectedImage;
  int _selectedColorIndex = 1;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _navigateToNextScreen() {
    print('Next button pressed!');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BankDetailsScreen()),
    );
    print('Selected image path: ${_selectedImage?.path}');
    print(
        'Selected color: ${AppColors.profileBackgrounds[_selectedColorIndex]}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/arrow_back.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Tell Us About Yourself',
          style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'RedHatDisplay'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              PhotoUploadWidget(
                selectedImage: _selectedImage,
                onTap: _pickImage,
              ),
              const SizedBox(height: 40),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Select Profile Background Color ',
                      style:
                          TextStyle(color: AppColors.textPrimary, fontSize: 16),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ColorGrid(
                selectedColorIndex: _selectedColorIndex,
                onColorSelected: (index) {
                  setState(() {
                    _selectedColorIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: PrimaryButton(
          text: 'Next',
          onPressed: _navigateToNextScreen,
          isExpanded: true,
          borderRadius: 16,
          icon: SvgPicture.asset('assets/svg/right-gesture.svg'),
        
          // Set padding to achieve a height similar to the original 55px container
          
          textStyle: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontFamily: 'RedHatDisplay',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      // --- MODIFICATION END ---
    );
  }

  
}