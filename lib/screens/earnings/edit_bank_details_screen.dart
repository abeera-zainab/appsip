import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:appsip/widgets/custom_text_input_field.dart';
import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/secondary_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditBankDetailsScreen extends StatelessWidget {
  const EditBankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bank Details'),
        
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/arrow_back.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- CHANGE 1: Manually created Dropdown with a consistent label ---
            // We do this because CustomTextInputField is for text, not dropdowns.
            const Text(
              'Select Bank',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.cardColorsecondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset('assets/svg/bank.svg'),
                ),
                hintText: 'Select Your Bank--',
              ),
              hint: const Text('Select Your Bank--'),
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                // Assuming 'vector.svg' is your dropdown arrow
                child: SvgPicture.asset('assets/svg/vector.svg'), 
              ),
              dropdownColor: AppColors.cardColor,
              items: ['Bank of America', 'Chase', 'Wells Fargo', 'Citibank']
                  .map((bank) => DropdownMenuItem(value: bank, child: Text(bank)))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),

            // --- CHANGE 2: Using the proper CustomTextInputField widget ---
            CustomTextInputField(
              label: 'Account Holder Name',
              hint: 'Type your full name here...',
            ),
            const SizedBox(height: 20),

            // --- CHANGE 3: Using CustomTextInputField for the account number ---
            CustomTextInputField(
              label: 'Account Number',
              hint: 'XXXX - XXXX - XXXX - XXXX',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),

            // Button Row remains the same
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    text: 'Cancel',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: PrimaryButton(
                    text: 'Save Changes',
                    onPressed: () {
                      // TODO: Add save logic here
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}