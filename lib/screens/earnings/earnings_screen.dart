import 'package:flutter/material.dart';

import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/secondary_button.dart';
import 'package:appsip/widgets/section_header.dart';
import 'package:appsip/widgets/withdrawal_list_item.dart';
import 'package:appsip/screens/earnings/edit_bank_details_screen.dart';
import 'package:appsip/widgets/withdraw_amount_sheet.dart';
import 'package:appsip/theme/app_colors.dart';

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
        title: const _EarningsAppBarTitle(),
        titleSpacing: 16.0,
        toolbarHeight: 80,
        actions: const [
          _EarningsAppBarAction(),
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
            const _OverviewCards(),
            const SizedBox(height: 24),
            _ActionButtons(
              onWithdrawPressed: () => _showWithdrawSheet(context),
            ),
            const SizedBox(height: 32),
            const _RecentWithdrawalsHeader(),
            const SizedBox(height: 16),
            const _WithdrawalsList(),
          ],
        ),
      ),
    );
  }
}

// --- AppBar Widgets ---

class _EarningsAppBarTitle extends StatelessWidget {
  const _EarningsAppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Earnings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.primaryRed)),
        const SizedBox(height: 4),
        Text('View your total earnings.', style: TextStyle(fontSize: 14, color: AppColors.textSecondary.withOpacity(0.8))),
      ],
    );
  }
}

class _EarningsAppBarAction extends StatelessWidget {
  const _EarningsAppBarAction();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

// --- Body Widgets ---

class _OverviewCards extends StatelessWidget {
  const _OverviewCards();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: _InfoCard(title: 'Total Earnings', amount: '\$21,408', cents: '.00')),
        SizedBox(width: 16),
        Expanded(child: _InfoCard(title: 'Available For Withdraw', amount: '\$12,723', cents: '.32')),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String amount;
  final String cents;

  const _InfoCard({
    required this.title,
    required this.amount,
    required this.cents,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryRed.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
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
}

class _ActionButtons extends StatelessWidget {
  final VoidCallback onWithdrawPressed;

  const _ActionButtons({required this.onWithdrawPressed});

  @override
  Widget build(BuildContext context) {
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
            onPressed: onWithdrawPressed,
          ),
        ),
      ],
    );
  }
}

class _RecentWithdrawalsHeader extends StatelessWidget {
  const _RecentWithdrawalsHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent Withdrawals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _FilterChip(label: 'Today', isSelected: true),
              _FilterChip(label: 'Last 7 days'),
              _FilterChip(label: 'Last 30 days'),
              _FilterChip(label: 'Success'),
              _FilterChip(label: 'Failed'),
            ],
          ),
        )
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
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
}

class _WithdrawalsList extends StatelessWidget {
  const _WithdrawalsList();

  @override
  Widget build(BuildContext context) {
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