import 'package:flutter/material.dart';
import 'package:appsip/main.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.bottomNavBackground,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.wallet_giftcard, 'Redeems', 0),
            _buildNavItem(Icons.monetization_on, 'Earnings', 1),
            _buildNavItem(Icons.military_tech, 'Challenges', 2),
            _buildNavItem(Icons.person_outline, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = selectedIndex == index;
    final Color color = isSelected ? AppColors.primaryRed : AppColors.textSecondary;

    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            label, 
            style: TextStyle(
              color: color, 
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}