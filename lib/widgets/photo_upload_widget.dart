import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:appsip/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoUploadWidget extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTap;

  const PhotoUploadWidget({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double containerSize = 250;
    const Radius cornerRadius = Radius.circular(35);

    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          color: AppColors.primaryRed,
          strokeWidth: 2,
          borderType: BorderType.RRect,
          radius: cornerRadius,
          dashPattern: const [14, 10],
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(cornerRadius),
            child: Container(
              width: containerSize,
              height: containerSize,
              color: AppColors.cardColorsecondary,
              child: selectedImage != null
                  ? Image.file(
                      selectedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : const _UploadPlaceholder(),
            ),
          ),
        ),
      ),
    );
  }
}

class _UploadPlaceholder extends StatelessWidget {
  const _UploadPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/media-image-plus.svg',
            
          ),
          const SizedBox(height: 15),
          const Text(
            'Upload Your Photo',
            style: TextStyle(
              color: AppColors.primaryRed,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}