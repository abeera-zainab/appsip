import 'package:flutter/material.dart';
import '../widgets/custom_text_input_field.dart';
import '../widgets/custom_dropdown_field.dart';
import '../widgets/submit_button.dart';
import 'success_screen.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // This will pop the screen and go back to the previous one
            // e.g., "Tell us about yourself" screen
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Enter Your Bank Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // --- Bank Selection Dropdown ---
              const CustomDropdownField(
                label: 'Select Bank',
                hintText: 'Select Your Bank--',
                items: ['Bank of America', 'Chase', 'Wells Fargo', 'Citibank'], // Dummy data
              ),
              const SizedBox(height: 24),
              
              // --- Account Holder Name Field ---
              const CustomTextInputField(
                label: 'Account Holder Name',
                hint: 'Type your full name here...',
              ),
              const SizedBox(height: 24),

              // --- Account Number Field ---
              const CustomTextInputField(
                label: 'Account Number',
                hint: 'XXXX - XXXX - XXXX - XXXX',
                keyboardType: TextInputType.number,
              ),

              // This Spacer pushes the button to the bottom
              const Spacer(),

              // --- Submit Button ---
              CustomSubmitButton(
                text: 'Submit',
                onPressed: () {
                  // Navigate to the success screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SuccessScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20), // Padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}