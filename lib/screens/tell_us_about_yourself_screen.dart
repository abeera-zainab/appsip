// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:io';
import 'dart:math';
import 'package:appsip/screens/edit_bank.dart';
import 'package:appsip/screens/edit_bank.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart'; // IMPORT THIS PACKAGE

// --- SUNBURST PAINTER (Unchanged) ---
class SunburstPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width;
    const int numberOfDarkRays = 18;
    const int totalSectors = numberOfDarkRays * 2;
    final anglePerSector = (2 * pi) / totalSectors;
    final paint = Paint()
      ..color = const Color.fromARGB(238, 245, 243, 243).withOpacity(0.11)
      ..style = PaintingStyle.fill;
    final rect = Rect.fromCircle(center: center, radius: radius);
    for (int i = 0; i < totalSectors; i++) {
      if (i.isEven) {
        final startAngle = i * anglePerSector;
        canvas.drawArc(rect, startAngle, anglePerSector, true, paint);
      }
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// --- MAIN SCREEN WIDGET ---
class TellUsAboutYourselfScreen extends StatefulWidget {
  const TellUsAboutYourselfScreen({super.key});

  @override
  State<TellUsAboutYourselfScreen> createState() =>
      _TellUsAboutYourselfScreenState();
}

class _TellUsAboutYourselfScreenState extends State<TellUsAboutYourselfScreen> {
  File? _selectedImage;
  int _selectedColorIndex = 1;

  final List<Color> _backgroundColors = [
    Colors.transparent,
    const Color(0xFFFF4848),
    const Color(0xFFFFBF00),
    const Color(0xFF46C85C),
    const Color(0xFF00EE87),
    const Color(0xFF00E1FF),
    const Color(0xFF489BFF),
    const Color(0xFF5548FF),
    const Color(0xFFC532C5),
    const Color(0xFFFF5F8A),
    const Color(0xFFCA0003),
    const Color(0xFF5300B1),
    const Color(0xFF00E5BF),
    const Color(0xFF32E500),
    const Color(0xFF923F00),
  ];

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282828),
      appBar: AppBar(
        backgroundColor: const Color(0xFF282828),
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
              // This method now uses DottedBorder
              _buildPhotoUpload(),
              const SizedBox(height: 40),
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
      bottomNavigationBar: _buildNextButton(),
    );
  }

  // --- REBUILT PHOTO UPLOAD WIDGET USING DOTTED_BORDER ---
  Widget _buildPhotoUpload() {
    const Color accentRed = Color(0xFFFE415B);
    const Color innerBgColor = Color(0xFF3C2023);
    const double containerSize = 250;
    const Radius cornerRadius = Radius.circular(35);

    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: DottedBorder(
          color: accentRed,
          strokeWidth: 2,
          borderType: BorderType.RRect, // For rounded rectangle
          radius: cornerRadius,
        
          dashPattern: const [14, 10],
          padding: const EdgeInsets.all(6), // Add some padding between border and content
          child: ClipRRect(
            borderRadius: const BorderRadius.all(cornerRadius),
            child: Container(
              width: containerSize,
              height: containerSize,
              color: innerBgColor,
              child: _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            color: accentRed,
                            size: 50,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Upload Your Photo',
                            style: TextStyle(
                              color: accentRed,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }


  // --- UNCHANGED WIDGETS BELOW ---
  Widget _buildColorGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _backgroundColors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final color = _backgroundColors[index];
        final isSelected = _selectedColorIndex == index;

        if (index == 0) {
          return GestureDetector(
            onTap: () => print('Color picker tapped'),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const SweepGradient(
                  colors: [
                    Colors.red, Colors.yellow, Colors.green, Colors.blue, Colors.purple, Colors.red
                  ],
                ),
                border: isSelected ? Border.all(color: Colors.white, width: 2.5) : null,
              ),
              child: const Icon(Icons.colorize_outlined, color: Colors.white, size: 30),
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColorIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: isSelected
                  ? Border.all(color: Colors.white, width: 2.5)
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.5),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(color: color),
                  CustomPaint(
                    size: Size.infinite,
                    painter: SunburstPainter(),
                  ),
                  if (isSelected)
                    const Icon(Icons.check, color: Colors.white, size: 30),
                ],
              ),
            ),
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
          print('Next button pressed!');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BankDetailsScreen()),
          );
          print('Selected image path: ${_selectedImage?.path}');
          print('Selected color: ${_backgroundColors[_selectedColorIndex]}');
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
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