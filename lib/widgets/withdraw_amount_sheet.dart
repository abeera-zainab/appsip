import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'dart:async';
import 'package:appsip/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class WithdrawAmountSheet extends StatefulWidget {
  const WithdrawAmountSheet({super.key});

  @override
  State<WithdrawAmountSheet> createState() => _WithdrawAmountSheetState();
}

class _WithdrawAmountSheetState extends State<WithdrawAmountSheet> {
  final TextEditingController _amountController = TextEditingController(text: '0.00');

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _showSuccessAndPop() {
    Navigator.pop(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const SuccessDialog(),
    );
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
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
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
          child: PrimaryButton(
            text: 'Cancel',
            onPressed: () => Navigator.pop(context),
            backgroundColor: const Color(0xFF2C2C2E),
            borderRadius: 16,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: PrimaryButton(
            text: 'Withdraw Amount',
            onPressed: _showSuccessAndPop,
            borderRadius: 16,
          ),
        ),
      ],
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
    
        child: SvgPicture.asset('assets/images/Check.png',
        width: 160,
        height: 160,)
    );
  }
}