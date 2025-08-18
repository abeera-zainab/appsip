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



class TellUsAboutYourselfScreen extends StatefulWidget {
  const TellUsAboutYourselfScreen({super.key});

  @override
  State<TellUsAboutYourselfScreen> createState() => _TellUsAboutYourselfScreenState();
}

class _TellUsAboutYourselfScreenState extends State<TellUsAboutYourselfScreen> {
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

  // The navigation logic is kept separate for clarity
  void _navigateToNextScreen() {
    print('Next button pressed!');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BankDetailsScreen()),
    );
    print('Selected image path: ${_selectedImage?.path}');
    print('Selected color: ${AppColors.profileBackgrounds[_selectedColorIndex]}');
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
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'RedHatDisplay'),
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
              const Text(
                'Select Profile Background Color *',
                style: TextStyle(color: AppColors.textPrimary, fontSize: 16),
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
      // CHANGED: Calling the local helper method instead of the external widget
      bottomNavigationBar: _buildNextButton(),
    );
  }

  // ADDED: Helper method for the button is back inside the screen's state class
  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ElevatedButton(
        // The onPressed now calls the navigation method directly
        onPressed: _navigateToNextScreen,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryRed, AppColors.primaryRed],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            alignment: Alignment.center,
            height: 55,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: AppColors.textPrimary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

