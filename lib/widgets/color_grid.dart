import 'dart:math'; // Import for math functions like pi, cos, and sin
import 'package:flutter/material.dart';
import 'package:appsip/main.dart'; 

class SunburstPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.7; // Make radius large enough to cover the area
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.10) // White rays with low opacity
      ..style = PaintingStyle.fill;

    const int numberOfRays = 24;
    final double anglePerSegment = (2 * pi) / numberOfRays;
    final double rayWidthAngle = anglePerSegment / 2; // Each ray takes half the segment

    for (int i = 0; i < numberOfRays; i++) {
      final double currentAngle = i * anglePerSegment;
      
      final path = Path();
      path.moveTo(center.dx, center.dy); // Start at the center

      // Calculate the two outer vertices of the triangular ray
      final p1 = Offset(
        center.dx + radius * cos(currentAngle - rayWidthAngle / 2),
        center.dy + radius * sin(currentAngle - rayWidthAngle / 2),
      );
      final p2 = Offset(
        center.dx + radius * cos(currentAngle + rayWidthAngle / 2),
        center.dy + radius * sin(currentAngle + rayWidthAngle / 2),
      );
      
      path.lineTo(p1.dx, p1.dy);
      path.lineTo(p2.dx, p2.dy);
      path.close();
      
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ColorGrid extends StatelessWidget {
  final int selectedColorIndex;
  final ValueChanged<int> onColorSelected;

  const ColorGrid({
    super.key,
    required this.selectedColorIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // ----------------- NO CHANGE HERE -----------------
      itemCount: AppColors.profileBackgrounds.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        // ----------------- NO CHANGE HERE -----------------
        final color = AppColors.profileBackgrounds[index];
        final isSelected = selectedColorIndex == index;

        // Color Picker Icon
        if (index == 0) {
          return GestureDetector(
            onTap: () {
              onColorSelected(index); 
              print('Color picker tapped');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const SweepGradient(
                  colors: [Colors.red, Colors.yellow, Colors.green, Colors.blue, Colors.purple, Colors.red],
                ),
             
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
         
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.5),
                    child: CustomPaint(size: Size.infinite, painter: SunburstPainter()),
                  ),
                  const Icon(Icons.colorize_outlined, color: AppColors.textPrimary, size: 30),
                ],
              ),
            ),
          );
        }

        
        return GestureDetector(
          onTap: () => onColorSelected(index),
          child: Container(
             // The border is applied to the container, not inside the ClipRRect
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: isSelected ? Border.all(color: Colors.white, width: 2.5) : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.5), // Slightly smaller radius for the content
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(color: color),
                  CustomPaint(size: Size.infinite, painter: SunburstPainter()),
                  if (isSelected) const Icon(Icons.check, color: Colors.white, size: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}