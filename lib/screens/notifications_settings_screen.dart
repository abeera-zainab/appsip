import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appsip/main.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  Map<String, bool> settings = {
    'skip_pass': false,
    'challenge_updates': true,
    'payouts': false,
    'team_announcements': true,
    'app_updates': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            'assets/svg/arrow_back.svg',
            colorFilter: const ColorFilter.mode(
                AppColors.textPrimary, BlendMode.srcIn),
          ),
        ),
        title: const Text(
          'Notification Settings',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontFamily: 'RedHatDisplay',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          _buildNotificationItem(
            'New Skip Pass Redeemed',
            'Alert me when a customer redeems a pass at my bar.',
            settings['skip_pass']!,
            (v) => setState(() => settings['skip_pass'] = v),
          ),
          _buildNotificationItem(
            'Challenge Updates',
            'Get notified when new weekly challenges go live or when one is completed.',
            settings['challenge_updates']!,
            (v) => setState(() => settings['challenge_updates'] = v),
          ),
          _buildNotificationItem(
            'Payout Notifications',
            'Be alerted when payouts are sent or your balance is updated.',
            settings['payouts']!,
            (v) => setState(() => settings['payouts'] = v),
          ),
          _buildNotificationItem(
            'Team Announcements',
            'Updates from venue owners or SipSkip team messages.',
            settings['team_announcements']!,
            (v) => setState(() => settings['team_announcements'] = v),
          ),
          _buildNotificationItem(
            'App Updates & Tips',
            'Learn about new features or improvements.',
            settings['app_updates']!,
            (v) => setState(() => settings['app_updates'] = v),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
      String title, String description, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: AppColors.cardColorsecondary,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontFamily: 'RedHatDisplay',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontFamily: 'RedHatDisplay',
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => onChanged(!value),
            child: SvgPicture.asset(
              value ? 'assets/svg/switch-on.svg' : 'assets/svg/switch-off.svg',
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}