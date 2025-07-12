import 'package:appsip/widgets/primary_button.dart';
import 'package:appsip/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:appsip/main.dart'; 

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  void _showRewardCollected(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const RewardCollectedDialog(),
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
            const Text(
              'Challenges',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: AppColors.primaryRed),
            ),
            const SizedBox(height: 4),
            Text('Earn rewards while you work.', style: TextStyle(fontSize: 14, color: AppColors.textSecondary.withOpacity(0.8))),
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
                Icon(Icons.account_balance_wallet_outlined, size: 16, color: AppColors.textSecondary),
                SizedBox(width: 8),
                Text('\$12,723.32', style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.textSecondary)),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                    Text('Today', style: TextStyle(color: AppColors.textSecondary)),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildOverviewCards(),
            const SizedBox(height: 32),
            const SectionHeader(title: 'Weekly Challenges'),
            const SizedBox(height: 16),
            _buildChallengeCard(
              context: context,
              title: 'Speed Redeem',
              reward: '+5.00',
              description: 'Complete 5 redeems in one day',
              progress: 2,
              total: 5,
            ),
            const SizedBox(height: 12),
            _buildChallengeCard(
              context: context,
              title: 'Triple Night',
              reward: '+15.00',
              description: 'Redeem Skills 3 nights in a row.',
              isFullyCompleted: true,
            ),
            const SizedBox(height: 32),
            const SectionHeader(title: 'Overall Challenges', titleStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.normal)),
            const SizedBox(height: 16),
            _buildChallengeCard(
              context: context,
              title: 'First Redeem Ever',
              reward: '+50.00',
              description: 'Complete 5 redeems in one day',
              progress: 2,
              total: 5,
            ),
            const SizedBox(height: 12),
            _buildChallengeCard(
              context: context,
              title: '10 Passes Served',
              reward: '+30.00',
              description: 'Reach your first 10 successful pass redeems.',
              progress: 10,
              total: 10,
              isCompleted: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCards() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildOverviewStatCard('240', 'Overall Challenges\nCompleted'),
              const SizedBox(height: 12),
              _buildOverviewStatCard('3', 'Weekly Challenges\nCompleted'),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: _buildBonusCard('Bonus Earned', '\$18', '.00'),
        ),
      ],
    );
  }

  Widget _buildOverviewStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.primaryRed.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        // ignore: deprecated_member_use
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
  
  Widget _buildBonusCard(String title, String amount, String cents) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 154,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.primaryRed.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        // ignore: deprecated_member_use
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

  Widget _buildChallengeCard({
    required BuildContext context,
    required String title,
    required String reward,
    required String description,
    int progress = 0,
    int total = 1,
    bool isCompleted = false,
    bool isFullyCompleted = false,
  }) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryRed)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: AppColors.paidGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(reward, style: const TextStyle(color: AppColors.paidGreen, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          const SizedBox(height: 16),
          if (isFullyCompleted)
             const Row(
                children: [
                  Icon(Icons.check_circle, color: AppColors.primaryRed, size: 18),
                  SizedBox(width: 8),
                  Text('Completed', style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold)),
                ],
              )
          else if (isCompleted)
            Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.primaryRed, size: 18),
                const SizedBox(width: 8),
                const Text('Completed', style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold)),
                const Spacer(),
                PrimaryButton(
                  text: 'Collect Reward',
                  onPressed: () => _showRewardCollected(context),
                  icon: const Icon(Icons.military_tech, size: 16),
                  backgroundColor: AppColors.paidGreen,
                  foregroundColor: Colors.black,
                  borderRadius: 20,
                ),
              ],
            )
          else
            LayoutBuilder(
              builder: (ctx, constraints) {
                return Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 28,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * (progress / total),
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '$progress/$total',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}

class RewardCollectedDialog extends StatelessWidget {
  const RewardCollectedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 50),
            ),
            const SizedBox(height: 24),
            const Text(
              'Reward Collected!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your reward money has been added to your wallet.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}