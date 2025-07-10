import 'package:flutter/material.dart';
import 'package:appsip/main.dart';

class WithdrawalListItem extends StatelessWidget {
  final String amount;
  final String date;
  final String trxId;
  final String status;

  const WithdrawalListItem({
    Key? key,
    required this.amount,
    required this.date,
    required this.trxId,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MODIFIED: Amount text is now red and bold
              Text(
                '\$$amount',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryRed,
                ),
              ),
              const SizedBox(height: 6),
              // MODIFIED: Date/TRX text is now grey and regular weight
              Text(
                '$date • $trxId',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          _buildStatusBadge(),
        ],
      ),
    );
  }

  // UNCHANGED: The status badge logic remains the same.
  Widget _buildStatusBadge() {
    Color badgeColor;
    String text;
    Widget? icon;

    switch (status) {
      case 'Paid':
        badgeColor = AppColors.paidGreen;
        text = 'Paid';
        break;
      case 'Pending':
        badgeColor = AppColors.pendingYellow;
        text = 'Pending';
        break;
      case 'Failed':
        badgeColor = AppColors.failedRed;
        text = 'Failed';
        icon = const Icon(Icons.refresh, color: Colors.white, size: 16);
        break;
      default:
        badgeColor = Colors.grey;
        text = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(text, style: TextStyle(color: badgeColor, fontWeight: FontWeight.bold)),
          if (icon != null) const SizedBox(width: 8),
          if (icon != null) icon,
        ],
      ),
    );
  }
}