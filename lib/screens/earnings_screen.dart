import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/secondary_button.dart';
import 'package:appsip/widgets/section_header.dart';
import 'package:appsip/widgets/withdrawal_list_item.dart';
import 'package:appsip/screens/edit_bank_details_screen.dart';
import 'package:appsip/widgets/withdraw_amount_sheet.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  void _showWithdrawSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const WithdrawAmountSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Earnings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.primaryRed)),
            const SizedBox(height: 4),
          
            // ignore: deprecated_member_use
            Text('View your total earnings.', style: TextStyle(fontSize: 14, color: AppColors.textSecondary.withOpacity(0.8))),
          ],
        ),
        titleSpacing: 16.0,
        toolbarHeight: 80,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondary),
                SizedBox(width: 8),
                Text('\$12,723.32', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: 'Overview',
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Text('This Month', style: TextStyle(color: AppColors.textSecondary)),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildOverviewCards(),
            const SizedBox(height: 24),
            _buildActionButtons(context),
            const SizedBox(height: 32),
            _buildRecentWithdrawalsHeader(),
            const SizedBox(height: 16),
            _buildWithdrawalsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCards() {
    return Row(
      children: [
        Expanded(child: _buildInfoCard('Total Earnings', '\$21,408', '.00')),
        const SizedBox(width: 16),
        Expanded(child: _buildInfoCard('Available For Withdraw', '\$12,723', '.32')),
      ],
    );
  }

  Widget _buildInfoCard(String title, String amount, String cents) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.primaryRed.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        // ignore: deprecated_member_use
        border: Border.all(color: AppColors.primaryRed.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontFamily: 'RedHatDisplay', fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryRed),
              children: [
                TextSpan(text: amount),
                TextSpan(text: cents, style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SecondaryButton(
            text: 'Edit Bank Details',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EditBankDetailsScreen())),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: PrimaryButton(
            text: 'Withdraw Earnings',
            onPressed: () => _showWithdrawSheet(context),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentWithdrawalsHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent Withdrawals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip('Today', isSelected: true),
              _buildFilterChip('Last 7 days'),
              _buildFilterChip('Last 30 days'),
              _buildFilterChip('Success'),
              _buildFilterChip('Failed'),
            ],
          ),
        )
      ],
    );
  }
  
  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: isSelected ? AppColors.primaryRed.withOpacity(0.15) : AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primaryRed : Colors.transparent,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppColors.primaryRed : AppColors.textSecondary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
  
  Widget _buildWithdrawalsList() {
    final withdrawals = [
      {'amount': '220.00', 'date': 'Jun 2, 2025 11:36:56 am', 'trx': 'TRX-1475', 'status': 'Paid'},
      {'amount': '220.00', 'date': 'May 20, 2025 5:15:41 am', 'trx': 'TRX-2980', 'status': 'Pending'},
      {'amount': '220.00', 'date': 'May 11, 2025 8:44:45 pm', 'trx': 'TRX-3203', 'status': 'Failed'},
      {'amount': '220.00', 'date': 'May 3, 2025 1:53:01 pm', 'trx': 'TRX-3868', 'status': 'Paid'},
    ];

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: withdrawals.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = withdrawals[index];
        return WithdrawalListItem(
          amount: item['amount']!,
          date: item['date']!,
          trxId: item['trx']!,
          status: item['status']!,
        );
      },
    );
  }
}