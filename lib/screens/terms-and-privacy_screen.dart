import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TermsAndPrivacyScreen extends StatelessWidget {
  const TermsAndPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
      
       
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/arrow_back.svg'),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Terms & Privacy Policies',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'RedHatDisplay',
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Scrollable text content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Heading('Heading 01'),
                  const SizedBox(height: 16),
                  const _Paragraph(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque enim eget purus vulputate, in gravida est ornare. Nam eu eros ac mauris posuere sollicitudin.',
                  ),
                  const SizedBox(height: 20),
                  const _Paragraph(
                    'Fusce feugiat vulputate ex, eget pellentesque nunc commodo in. Nam sed magna at nulla lacinia semper. Aliquam ut odio egestas, faucibus velit a, ornare turpis.',
                  ),
                  const SizedBox(height: 20),
                  const _Paragraph(
                    'Nulla id iaculis tellus, tempus dapibus magna. Morbi quis nulla ac augue euismod euismod:',
                  ),
                  const SizedBox(height: 12),
                  const _ListItem('Nam id ante in nibh placerat iaculis.'),
                  const _ListItem('Curabitur magna magna, faucibus a tellus eget.'),
                  const _ListItem('Blandit aliquet mauris.'),
                  const SizedBox(height: 20),
                  const _Paragraph(
                    'Quis ac velit non risus luctus commodo. Nullam et sem nibh.',
                  ),
                  const SizedBox(height: 30),
                  const _Heading('Heading 01'),
                  const SizedBox(height: 16),
                  const _Paragraph(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque enim eget purus vulputate, in gravida est ornare. Nam eu eros ac mauris posuere sollicitudin.',
                  ),
                  const SizedBox(height: 20),
                  const _Paragraph(
                    'Fusce feugiat vulputate ex, eget pellentesque nunc commodo in. Nam sed magna at nulla lacinia semper. Aliquam ut odio egestas, faucibus velit a, ornare turpis.',
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Text Styling ---

class _Heading extends StatelessWidget {
  final String text;
  const _Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'RedHatDisplay',
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold, // Extra bold for headings
        fontSize: 24,
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;
  const _Paragraph(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'RedHatDisplay',
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.5, // Line height for better readability
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String text;
  const _ListItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontFamily: 'RedHatDisplay',
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.normal
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'RedHatDisplay',
                color: AppColors.textPrimary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}