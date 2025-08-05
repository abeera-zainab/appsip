// lib/screens/notifications_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// Assuming these files exist and are correctly set up
import 'package:appsip/main.dart';
import 'package:appsip/screens/notifications_settings_screen.dart';

// --- Data Model for a Notification (Updated) ---
class NotificationModel {
  final String imageUrl;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isUnread; // Added to handle the read/unread state

  NotificationModel({
    required this.imageUrl,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isUnread = false, // Default to 'read'
  });
}

// --- Main Screen Widget (Updated) ---
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data updated with the 'isUnread' flag
    final List<NotificationModel> notifications = [
      NotificationModel(
          imageUrl: 'assets/images/image1.png',
          title: 'Ut sodales, ex sit amet consectetur accumsa...',
          timestamp: DateTime(2025, 6, 20, 8, 3),
          body: 'Maecenas dignissim justo eget nulla rutrum molestie. Maecenas lobortis sem dui, vel rutr...',
          isUnread: true),
      NotificationModel(
          imageUrl: 'assets/images/image2.png',
          title: 'Vestibulum tempus imperdiet sem ac porttit...',
          timestamp: DateTime(2025, 6, 18, 14, 12),
          body: 'Pellentesque suscipit fringilla libero eu ullamcorper. Cras risus eros, faucibus sit ame...',
          isUnread: true),
      NotificationModel(
          imageUrl: 'assets/images/image3.png',
          title: 'Aliquam a dui vel justo fringilla euismod id id...',
          timestamp: DateTime(2025, 6, 13, 13, 55),
          body: 'Donec a eros justo. Fusce egestas tristique ultrices. Nam tempor, augue nec tincidunt m...'),
      NotificationModel(
          imageUrl: 'assets/images/image4.png',
          title: 'Lorem ipsum dolor sit amet, consectetur adi...',
          timestamp: DateTime(2025, 6, 6, 2, 15),
          body: 'Donec dictum tristique porta. Etiam convallis lorem lobortis nulla molestie, nec tincidunt ex...'),
      NotificationModel(
          imageUrl: 'assets/images/image5.png',
          title: 'Donec vitae mi vulputate, suscipit urna in, ma...',
          timestamp: DateTime(2025, 5, 28, 9, 54),
          body: 'Donec vitae mi vulputate, suscipit urna in, malesuada nisl. Pellentesque laoreet pretium...'),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset('assets/svg/arrow_back.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
        ),
        title: const Text(
          'Notifications (2)',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'RedHatDisplay',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NotificationSettingsScreen()),
              );
            },
            icon: SvgPicture.asset('assets/svg/settings.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      // UPDATED to use ListView.separated for clean dividers
      body: ListView.separated(
        // Padding for the entire list, which also contains the dividers
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return _NotificationListItem(notification: notifications[index]);
        },
        separatorBuilder: (context, index) {
          // This builder creates the divider between each item
          return const Divider(color: AppColors.divider, height: 1, thickness: 1);
        },
      ),
    );
  }
}

// --- Reusable Widget for a single notification item (Updated) ---
class _NotificationListItem extends StatelessWidget {
  final NotificationModel notification;

  const _NotificationListItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    // Format the date and time, converting to lowercase am/pm
    final String formattedTimestamp = DateFormat('MMM d, yyyy h:mm a').format(notification.timestamp).toLowerCase();

    return Container(
      // Apply the highlight color only if the notification is unread
      color: notification.isUnread ? AppColors.cardColorsecondary: Colors.transparent,
      // Padding is now inside the container to ensure the background fills the space
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(notification.imageUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'RedHatDisplay',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  formattedTimestamp,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'RedHatDisplay',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  notification.body,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'RedHatDisplay',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}