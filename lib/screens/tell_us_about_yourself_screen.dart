// ignore_for_file: deprecated_member_use

import 'dart:io'; // Required for the File type
import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'package:dotted_border/dotted_border.dart'; // For the dashed border

class TellUsAboutYourselfScreen extends StatefulWidget {
  const TellUsAboutYourselfScreen({super.key});

  @override
  State<TellUsAboutYourselfScreen> createState() =>
      _TellUsAboutYourselfScreenState();
}

class _TellUsAboutYourselfScreenState extends State<TellUsAboutYourselfScreen> {
  // State variables to hold the selected image file and the selected color index
  File? _selectedImage;
  int _selectedColorIndex = 1; // Default selection is the 2nd item (index 1)

  // A list of colors for the background selector.
  // The first one is a placeholder for the color picker functionality.
  final List<Color> _backgroundColors = [
    Colors.transparent, // Placeholder for rainbow picker
    const Color(0xFFFE6767),
    const Color(0xFFFFC107),
    const Color(0xFFB2D36F),
    const Color(0xFF67FEC5),
    const Color(0xFF67B6FE),
    const Color(0xFF9B67FE),
    const Color(0xFFD667FE),
    const Color(0xFFFE67B6),
    const Color(0xFFFE6790),
    const Color(0xFFFE6767),
    const Color(0xFFB167FE),
    const Color(0xFF67FEA1),
    const Color(0xFF67FEE5),
    const Color(0xFF4CAF50),
    const Color(0xFFD38D6F),
  ];

  // Function to handle picking an image from the gallery
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    // Use .pickImage to open the gallery
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // If an image is selected, update the state to rebuild the UI
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Tell Us About Yourself',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              // --- Photo Upload Section ---
              _buildPhotoUpload(),
              const SizedBox(height: 40),

              // --- Background Color Selection ---
              const Text(
                'Select Profile Background Color *',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              _buildColorGrid(),
            ],
          ),
        ),
      ),
      // --- Bottom Navigation Button ---
      bottomNavigationBar: _buildNextButton(),
    );
  }

  Widget _buildPhotoUpload() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage, // Trigger the image picker on tap
        child: DottedBorder(
          color: Colors.red.withOpacity(0.7),
          strokeWidth: 2,
          dashPattern: const [8, 4],
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade900.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            // Display the selected image or the placeholder
            child: _selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.red,
                        size: 50,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Upload Your Photo',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorGrid() {
    return GridView.builder(
      shrinkWrap: true, // Important to use inside a Column
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling of the grid itself
      itemCount: _backgroundColors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // 5 items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final color = _backgroundColors[index];
        final isSelected = _selectedColorIndex == index;

        // Special case for the first item (the rainbow color picker)
        if (index == 0) {
          return GestureDetector(
            onTap: () {
              // TODO: Implement custom color picker logic here
              print('Color picker tapped');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const SweepGradient(
                  colors: [
                    Colors.red, Colors.yellow, Colors.green, Colors.blue, Colors.purple, Colors.red
                  ],
                ),
              ),
              child: const Icon(Icons.colorize, color: Colors.white),
            ),
          );
        }

        // For all other color swatches
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColorIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // The sunburst effect is created with a RadialGradient
              gradient: RadialGradient(
                // ignore: deprecated_member_use
                colors: [color.withOpacity(0.7), color],
                stops: const [0.2, 1.0],
              ),
              border: isSelected
                  ? Border.all(color: Colors.white, width: 2)
                  : null,
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white)
                : null,
          ),
        );
      },
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ElevatedButton(
        onPressed: () {
          // TODO: Add navigation to the next screen
          print('Next button pressed!');
          print('Selected image path: ${_selectedImage?.path}');
          print('Selected color: ${_backgroundColors[_selectedColorIndex]}');
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        // The child is a Container with the gradient
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFE6767), Color(0xFFE63946)],
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
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}