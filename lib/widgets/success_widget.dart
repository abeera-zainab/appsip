import 'package:flutter/material.dart';
import 'package:appsip/main.dart';

class SuccessScreenWidget extends StatelessWidget {
  final String title;
  final String? description;

  const SuccessScreenWidget({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Custom Checkmark Icon
              Container(
              
                child: Image.asset('assets/images/Check.png',
                height: 160,
                width: 160,)
              ),
              const SizedBox(height: 20),

              // Title Text
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RedHatDisplay',
                ),
              ),

              // Conditional Description Text
              if (description != null) ...[
                const SizedBox(height: 16),
                Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: 'RedHatDisplay',
                    fontWeight: FontWeight.normal
                  ),
                ),
                const Spacer(),
              ],
            ],
          ),
        ),
      ),
    );
  }
 
}