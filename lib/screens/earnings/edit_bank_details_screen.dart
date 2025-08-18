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
    // A reusable InputDecoration style to avoid repetition
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: AppColors.cardColorsecondary, // The requested color
      border: OutlineInputBorder( // A modern rounded border
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none, // No visible border line
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bank Details'),
      backgroundColor: AppColors.background,
        elevation: 0,
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
            CustomTextInputField(
              label: 'Select Bank',
              // We pass the DropdownButtonFormField to the 'field' property
              field: DropdownButtonFormField<String>(
                // We merge our reusable style with the specific icons for this field
                decoration: inputDecoration.copyWith(
                  prefixIcon: SvgPicture.asset('assets/svg/bank.svg'),
                  hintText: 'Select Your Bank--',
                ),
                hint: const Text('Select Your Bank--'),
                icon:  SvgPicture.asset('assets/svg/vector.svg'),
                dropdownColor: AppColors.cardColor,
                items: ['Bank of America', 'Chase', 'Wells Fargo', 'Citibank']
                    .map((bank) => DropdownMenuItem(value: bank, child: Text(bank)))
                    .toList(),
                onChanged: (value) {},
              ), fillColor: AppColors.cardColorsecondary, filled: true,
            ),
            const SizedBox(height: 20),
            // We now pass a fully decorated TextFormField to the custom widget
            CustomTextInputField(
              label: 'Account Holder Name',
              field: TextFormField(
                decoration: inputDecoration.copyWith(
                  hintText: 'Type your full name here...',
                ),
              ), fillColor: AppColors.cardColorsecondary, filled: true,
            ),
            const SizedBox(height: 20),
            // We do the same for the account number field
            CustomTextInputField(
              label: 'Account Number',
              field: TextFormField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration.copyWith(
                  hintText: 'XXXX - XXXX - XXXX - XXXX',
                 
                ),
              ), fillColor: AppColors.cardColorsecondary, filled: true,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    text: 'Cancel',
                    onPressed: () => Navigator.of(context).pop(),
                    // ignore: deprecated_member_use
                   
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: PrimaryButton(
                    text: 'Save Changes',
                    onPressed: () => Navigator.of(context).pop(),
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