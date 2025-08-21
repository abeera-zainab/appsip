// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/section_header.dart';
import 'package:appsip/theme/app_colors.dart';
import 'package:appsip/widgets/success_widget.dart'; 

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  // Updated to show the full-screen success widget
  void _showRewardCollected(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SuccessScreenWidget(
        title: 'Reward Collected!',
        description: 'Your reward money has been added to your wallet.',
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarTitle(),
        titleSpacing: 16.0,
        toolbarHeight: 80,
        actions: const [
          _AppBarAction(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _OverviewSection(),
            const SizedBox(height: 32),
            const SectionHeader(title: 'Weekly Challenges'),
            const SizedBox(height: 16),
            _ChallengeCard(
              title: 'Speed Redeem',
              reward: '+5.00',
              description: 'Complete 5 redeems in one day',
              progress: 2,
              total: 5,
              onCollectReward: () => _showRewardCollected(context),
            ),
            const SizedBox(height: 12),
            _ChallengeCard(
              title: 'Triple Night',
              reward: '+15.00',
              description: 'Redeem Skills 3 nights in a row.',
              isFullyCompleted: true,
              onCollectReward: () => _showRewardCollected(context),
            ),
            const SizedBox(height: 32),
            const SectionHeader(
              title: 'Overall Challenges',
              titleStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16),
            _ChallengeCard(
              title: 'First Redeem Ever',
              reward: '+50.00',
              description: 'Complete 5 redeems in one day',
              progress: 2,
              total: 5,
              onCollectReward: () => _showRewardCollected(context),
            ),
            const SizedBox(height: 12),
            _ChallengeCard(
              title: '10 Passes Served',
              reward: '+30.00',
              description: 'Reach your first 10 successful pass redeems.',
              progress: 10,
              total: 10,
              isCompleted: true,
              onCollectReward: () => _showRewardCollected(context),
            ),
          ],
        ),
      ),
    );
  }
}

// --- AppBar Widgets ---

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Challenges',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.primaryRed),
        ),
        const SizedBox(height: 4),
        Text(
          'Earn rewards while you work.',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary.withOpacity(0.8)),
        ),
      ],
    );
  }
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/wallet.svg'),
          const SizedBox(width: 8),
          const Text(
            '\$12,723.32',
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

// --- Body Widgets ---

class _OverviewSection extends StatelessWidget {
  const _OverviewSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Overview',
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(20)),
            child: const Row(
              children: [
                Text('Today', style: TextStyle(color: AppColors.textSecondary)),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary, size: 20),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _OverviewStatCard(value: '240', label: 'Overall Challenges\nCompleted'),
                  SizedBox(height: 12),
                  _OverviewStatCard(value: '3', label: 'Weekly Challenges\nCompleted'),
                ],
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: _BonusCard(title: 'Bonus Earned', amount: '\$18', cents: '.00'),
            ),
          ],
        ),
      ],
    );
  }
}

class _OverviewStatCard extends StatelessWidget {
  final String value;
  final String label;

  const _OverviewStatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryRed.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryRed.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryRed)),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: const TextStyle(color: AppColors.textSecondary, height: 1.3))),
        ],
      ),
    );
  }
}

class _BonusCard extends StatelessWidget {
  final String title;
  final String amount;
  final String cents;

  const _BonusCard({required this.title, required this.amount, required this.cents});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 154,
      decoration: BoxDecoration(
        color: AppColors.primaryRed.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryRed.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontFamily: 'RedHatDisplay', fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.primaryRed),
              children: [
                TextSpan(text: amount),
                TextSpan(text: cents, style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  final String title;
  final String reward;
  final String description;
  final int progress;
  final int total;
  final bool isCompleted;
  final bool isFullyCompleted;
  final VoidCallback onCollectReward;

  const _ChallengeCard({
    required this.title,
    required this.reward,
    required this.description,
    required this.onCollectReward,
    this.progress = 0,
    this.total = 1,
    this.isCompleted = false,
    this.isFullyCompleted = false,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryRed)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(color: AppColors.paidGreen.withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
                child: Text(reward, style: const TextStyle(color: AppColors.paidGreen, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          const SizedBox(height: 16),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    if (isFullyCompleted) {
      return const Row(
        children: [
          Icon(Icons.check_circle, color: AppColors.primaryRed, size: 18),
          SizedBox(width: 8),
          Text('Completed', style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold)),
        ],
      );
    } else if (isCompleted) {
      return Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.primaryRed, size: 18),
          const SizedBox(width: 8),
          const Text('Completed', style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold)),
          const Spacer(),
          PrimaryButton(
            text: 'Collect Reward',
            onPressed: onCollectReward,
            icon: const Icon(Icons.military_tech, size: 16),
            backgroundColor: AppColors.paidGreen,
            foregroundColor: Colors.black,
          ),
        ],
      );
    } else {
      return LayoutBuilder(
        builder: (ctx, constraints) {
          return Stack(
            children: [
              Container(width: double.infinity, height: 28, decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(20))),
              Container(width: constraints.maxWidth * (progress / total), height: 28, decoration: BoxDecoration(color: AppColors.primaryRed, borderRadius: BorderRadius.circular(20))),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Align(alignment: Alignment.centerRight, child: Text('$progress/$total', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}