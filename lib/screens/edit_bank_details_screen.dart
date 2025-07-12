import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:appsip/widgets/custom_text_input_field.dart';
import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/secondary_button.dart';

class EditBankDetailsScreen extends StatelessWidget {
  const EditBankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bank Details'),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
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
              field: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_balance, color: AppColors.textSecondary),
                ),
                hint: const Text('Select Your Bank--'),
                icon: const Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
                dropdownColor: AppColors.cardColor,
                items: ['Bank of America', 'Chase', 'Wells Fargo', 'Citibank']
                    .map((bank) => DropdownMenuItem(value: bank, child: Text(bank)))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextInputField(label: 'Account Holder Name', hint: 'Type your full name here...'),
            const SizedBox(height: 20),
            const CustomTextInputField(
              label: 'Account Number',
              hint: 'XXXX - XXXX - XXXX - XXXX',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    text: 'Cancel',
                    onPressed: () => Navigator.of(context).pop(),
                    // ignore: deprecated_member_use
                    color: AppColors.textSecondary.withOpacity(0.5),
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