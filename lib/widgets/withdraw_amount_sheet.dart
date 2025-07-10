import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'dart:async';

class WithdrawAmountSheet extends StatefulWidget {
  const WithdrawAmountSheet({super.key});

  @override
  State<WithdrawAmountSheet> createState() => _WithdrawAmountSheetState();
}

class _WithdrawAmountSheetState extends State<WithdrawAmountSheet> {
  // Using a controller to manage the text input
  final TextEditingController _amountController = TextEditingController(text: '0.00');

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _onKeyPressed(String value) {
    if (value == 'DEL') {
      String currentText = _amountController.text.replaceAll('.', '');
      if (currentText.length > 1) {
        currentText = currentText.substring(0, currentText.length - 1);
      } else {
        currentText = '0';
      }
       double numericValue = double.parse(currentText) / 100;
       _amountController.text = numericValue.toStringAsFixed(2);
    } else if (value == '+*#') {
      // Functionality for this key can be added here if needed
      return;
    } else {
      String currentText = _amountController.text.replaceAll('.', '');
       if (currentText == '0') {
         currentText = value;
       } else if (currentText.length < 9) { // Limit to 9 digits before decimal
         currentText += value;
       }
       double numericValue = double.parse(currentText) / 100;
       _amountController.text = numericValue.toStringAsFixed(2);
    }
    setState(() {}); // Trigger a rebuild to reflect changes
  }


  void _showSuccessAndPop() {
    Navigator.pop(context); // Close the bottom sheet
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const SuccessDialog(),
    );
    // After 2 seconds, close the success dialog
    Timer(const Duration(seconds: 2), () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Withdraw Amount', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Type the amount you want to withdraw.', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 24),
            _buildAmountInput(),
            const SizedBox(height: 16),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
            const SizedBox(height: 16),
            _buildBankInfo(),
            const SizedBox(height: 24),
            _buildActionButtons(),
            const SizedBox(height: 24),
            _buildNumericKeypad(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Amount', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: _amountController,
          readOnly: true,
          showCursor: true,
          cursorColor: AppColors.primaryRed,
          style: const TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 16, top: 12, right: 8),
              child: Text('\$', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
            ),
            filled: true,
            fillColor: AppColors.primaryRed.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.primaryRed.withOpacity(0.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.primaryRed.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primaryRed),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBankInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryRed.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryRed.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Bank_of_America_Logo.svg/2560px-Bank_of_America_Logo.svg.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bank of America', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 4),
                Text('John Doe •••• •••• 1234', style: TextStyle(color: AppColors.textSecondary)),
              ],
            ),
          ),
          const Icon(Icons.edit, color: AppColors.primaryRed),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color(0xFF2C2C2E), // Dark grey button background
              side: const BorderSide(color: Colors.transparent),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: _showSuccessAndPop,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.primaryRed,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            // Matching the typo from Figma
            child: const Text('Withdraw Ammount', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildNumericKeypad() {
    final keys = [
      {'num': '1', 'letters': ''}, {'num': '2', 'letters': 'ABC'}, {'num': '3', 'letters': 'DEF'},
      {'num': '4', 'letters': 'GHI'}, {'num': '5', 'letters': 'JKL'}, {'num': '6', 'letters': 'MNO'},
      {'num': '7', 'letters': 'PQRS'}, {'num': '8', 'letters': 'TUV'}, {'num': '9', 'letters': 'WXYZ'},
      {'num': '+*#', 'letters': ''}, {'num': '0', 'letters': ''}, {'num': 'DEL', 'letters': ''},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        final key = keys[index];
        return InkWell(
          onTap: () => _onKeyPressed(key['num']!),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E), 
              borderRadius: BorderRadius.circular(16),
            ),
            child: key['num'] == 'DEL'
                ? const Icon(Icons.backspace_outlined, color: AppColors.textPrimary)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(key['num']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                      if (key['letters']!.isNotEmpty)
                        Text(key['letters']!, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                    ],
                  ),
          ),
        );
      },
    );
  }
}


class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SuccessCheckmark(),
          SizedBox(height: 24),
          Text(
            'Your amount is on it way!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class SuccessCheckmark extends StatelessWidget {
  const SuccessCheckmark({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        height: 120,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [Color(0xFF66BB6A), Color(0xFF388E3C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            )
        ),
        child: const Icon(Icons.check_rounded, color: Colors.white, size: 80)
    );
  }
}