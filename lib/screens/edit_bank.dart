import 'package:appsip/screens/redeems/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:appsip/widgets/custom_text_input_field.dart';
import 'package:appsip/widgets/primary_button.dart';
// Removed the unused SecondaryButton import
import 'package:flutter_svg/flutter_svg.dart';

// Converted to StatefulWidget to handle dropdown state
class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  // State variable to store the selected bank
  String? _selectedBank;

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
            const Text(
              'Select Bank',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedBank, // Bind value to state
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
                child: SvgPicture.asset('assets/svg/vector.svg'), 
              ),
              dropdownColor: AppColors.cardColor,
              items: ['Bank of America', 'Chase', 'Wells Fargo', 'Citibank']
                  .map((bank) => DropdownMenuItem(value: bank, child: Text(bank)))
                  .toList(),
              onChanged: (value) {
                // Update state when a bank is selected
                setState(() {
                  _selectedBank = value;
                });
              },
            ),
            const SizedBox(height: 20),

            const CustomTextInputField(
              label: 'Account Holder Name',
              hint: 'Type your full name here...',
            ),
            const SizedBox(height: 20),

            const CustomTextInputField(
              label: 'Account Number',
              hint: 'XXXX - XXXX - XXXX - XXXX',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),

            // --- CHANGE: Replaced the Row with a single PrimaryButton ---
            PrimaryButton(
              text: 'Submit',
              isExpanded: true, // Makes the button full-width
              icon: SvgPicture.asset(
                'assets/svg/check.svg', // Ensure you have this file in your assets
                 // Style the icon to be visible on the button
              ),
              onPressed: () {
                // TODO: Add save logic here before popping
                
                          
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SuccessScreen(),
                            ));
                          
                        
              },
            ),
          ],
        ),
      ),
    );
  }
}