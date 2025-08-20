import 'package:appsip/screens/password/change_password_screen.dart';
import 'package:appsip/screens/earnings/edit_bank_details_screen.dart';
import 'package:appsip/screens/edit-profile/edit_profile_screen.dart';
import 'package:appsip/screens/help-and-support/help-and-support-screen.dart';
import 'package:appsip/screens/logout_screen.dart';
import 'package:appsip/screens/notifications/notifications_screen.dart';
import 'package:appsip/screens/profile_swap.dart';
import 'package:appsip/screens/terms-and-privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appsip/main.dart'; // Imports AppColors
import 'package:appsip/widgets/profile_header_card.dart';
import 'package:appsip/widgets/profile_menu_item.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopHeader(),
                const SizedBox(height: 30),
                const ProfileHeaderCard(
                  // Provide your actual asset path for the avatar
                  avatarImagePath: 'assets/images/avatar.png',
                  name: 'John',
                  venueName: 'The Brew House',
                ),
                const SizedBox(height: 40),
                
                // --- Menu List ---
                ProfileMenuItem(
                  title: "Notifications",
                  svgIconPath: 'assets/svg/bell.svg',
                  trailingText: '(2)', 
                  onTap: () { /* Handle Notifications tap */
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    ); },
                ),
                ProfileMenuItem(
                  title: "Edit Profile",
                  svgIconPath: 'assets/svg/edit.svg', 
                  onTap: () {   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    ); }
                ),
                ProfileMenuItem(
                  title: "Change Password",
                  svgIconPath: 'assets/svg/lock.svg', 
                  onTap: () { /* Handle Change Password tap */
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    ); },
                ),
                ProfileMenuItem(
                  title: "Edit Bank Details",
                  svgIconPath: 'assets/svg/bank.svg',
                  onTap: () { 
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditBankDetailsScreen(),
                      ),
                    ); 
                  },
                ),
                ProfileMenuItem(
                  title: "Help & Support",
                  svgIconPath: 'assets/svg/headset-help.svg', 
                  onTap: () { /* Handle Help & Support tap */
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpAndSupportScreen(),
                      ),
                    ); },
                ),
                ProfileMenuItem(
                  title: "Terms & Privacy Policies",
                  svgIconPath: 'assets/svg/page-flip.svg',
                  onTap: () { /* Handle T&C tap */
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsAndPrivacyScreen(),
                      ),
                    ); },
                ),
                ProfileMenuItem(
                  title: "Switch to Customer Profile",
                  svgIconPath: 'assets/svg/coins-swap.svg',
                  onTap: () { /* Handle Switch Profile tap */ 
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SwitchProfileScreen(),
                      ),
                    ); },
                ),
                ProfileMenuItem(
                  title: "Logout",
                  svgIconPath: 'assets/svg/log-out.svg',
                  customColor: AppColors.primaryRed,
                  onTap: () { /* Handle Logout tap */ 
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogoutPage(),
                      ),
                    ); },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                color: AppColors.primaryRed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Manage your account info.",
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.cardColorsecondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/svg/wallet.svg', 
                width: 20,
                height: 20,
                colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              const Text(
                "\$12,723.32",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}