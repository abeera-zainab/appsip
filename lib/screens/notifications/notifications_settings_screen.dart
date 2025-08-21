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
    
      appBar: AppBar(
       
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
          NotificationSettingItem(
            title: 'New Skip Pass Redeemed',
            description: 'Alert me when a customer redeems a pass at my bar.',
            value: settings['skip_pass']!,
            onChanged: (v) => setState(() => settings['skip_pass'] = v),
          ),
          NotificationSettingItem(
            title: 'Challenge Updates',
            description: 'Get notified when new weekly challenges go live or when one is completed.',
            value: settings['challenge_updates']!,
            onChanged: (v) => setState(() => settings['challenge_updates'] = v),
          ),
          NotificationSettingItem(
            title: 'Payout Notifications',
            description: 'Be alerted when payouts are sent or your balance is updated.',
            value: settings['payouts']!,
            onChanged: (v) => setState(() => settings['payouts'] = v),
          ),
          NotificationSettingItem(
            title: 'Team Announcements',
            description: 'Updates from venue owners or SipSkip team messages.',
            value: settings['team_announcements']!,
            onChanged: (v) => setState(() => settings['team_announcements'] = v),
          ),
          NotificationSettingItem(
            title: 'App Updates & Tips',
            description: 'Learn about new features or improvements.',
            value: settings['app_updates']!,
            onChanged: (v) => setState(() => settings['app_updates'] = v),
          ),
        ],
      ),
    );
  }
}


/// A reusable widget to display a single notification setting item with a toggle switch.
class NotificationSettingItem extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationSettingItem({
    super.key,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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