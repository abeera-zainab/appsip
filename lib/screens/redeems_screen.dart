import 'package:flutter/material.dart';
import 'package:appsip/main.dart';
import 'package:appsip/widgets/section_header.dart';

class Redemption {
  final String name;
  final String time;
  final String id;
  final PassType type;
  final double amount;

  Redemption({required this.name, required this.time, required this.id, required this.type, required this.amount});
}

enum PassType { Gold, Basic }

class RedeemsScreen extends StatefulWidget {
  const RedeemsScreen({super.key});

  @override
  State<RedeemsScreen> createState() => _RedeemsScreenState();
}

class _RedeemsScreenState extends State<RedeemsScreen> {
  final List<Redemption> _redemptions = [
    Redemption(name: 'Katie S.', time: '7:35:41 am', id: 'SKP-2078', type: PassType.Gold, amount: 5.00),
    Redemption(name: 'Chris G.', time: '1:28:15 pm', id: 'SKP-4945', type: PassType.Basic, amount: 2.50),
    Redemption(name: 'Daniel H.', time: '8:57:15 am', id: 'SKP-2600', type: PassType.Gold, amount: 5.00),
    Redemption(name: 'Kenneth A.', time: '7:27:25 pm', id: 'SKP-5112', type: PassType.Basic, amount: 2.50),
    Redemption(name: 'Stephanie N.', time: '10:58:58 pm', id: 'SKP-3109', type: PassType.Gold, amount: 5.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 80,
        title: _buildHeader(),
      ),
      body: SafeArea(
        top: false, // The app bar already provides top padding
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOverview(),
                const SizedBox(height: 24),
                _buildSearchBar(),
                const SizedBox(height: 20),
                _buildFilterChips(),
                const SizedBox(height: 24),
                _buildRedemptionsList(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Redeems', style: TextStyle(color: AppColors.primaryRed, fontSize: 20, fontWeight: FontWeight.normal)),
            SizedBox(height: 4),
            Text('See your pass redemptions.', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(20)),
          child: const Row(
            children: [
              Icon(Icons.account_balance_wallet_outlined, size: 20, color: AppColors.textSecondary),
              SizedBox(width: 8),
              Text('\$12,723.32', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOverview() {
    return Column(
      children: [
        SectionHeader(
          title: 'Overview',
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(20)),
            child: const Row(
              children: [
                Text('Today', style: TextStyle(color: Colors.white)),
                Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(child: OverviewCard(title: 'Total Redeems', value: '120')),
            SizedBox(width: 12),
            Expanded(child: OverviewCard(title: 'Gold Pass', value: '20')),
            SizedBox(width: 12),
            Expanded(child: OverviewCard(title: 'Basic Pass', value: '100')),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search a name, id or type...',
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.cardColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildFilterChips() {
    const filters = ['Today', 'Last 7 days', 'Last 30 days', 'Gold Pass', 'Basic Pass'];
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Chip(
            label: Text(filters[index]),
            labelStyle: const TextStyle(color: AppColors.textSecondary),
            backgroundColor: AppColors.cardColor,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }

  Widget _buildRedemptionsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _redemptions.length,
      itemBuilder: (context, index) => RedemptionListItem(redemption: _redemptions[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  const OverviewCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: AppColors.primaryRed, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class RedemptionListItem extends StatelessWidget {
  final Redemption redemption;
  const RedemptionListItem({super.key, required this.redemption});

  @override
  Widget build(BuildContext context) {
    final isGold = redemption.type == PassType.Gold;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(redemption.name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('${redemption.time} • ${redemption.id}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: isGold ? AppColors.pendingYellow.withOpacity(0.15) : AppColors.primaryRed.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  isGold ? Icons.workspace_premium : Icons.person_outline,
                  color: isGold ? AppColors.pendingYellow : AppColors.primaryRed,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(isGold ? 'Gold' : 'Basic', style: TextStyle(color: isGold ? AppColors.pendingYellow : AppColors.primaryRed, fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text('+\$${redemption.amount.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.primaryRed, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}