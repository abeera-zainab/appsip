import 'package:flutter/material.dart';
import 'package:appsip/widgets/success_widget.dart';

class AccountDeletionScheduledScreen extends StatelessWidget {
  const AccountDeletionScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessScreenWidget(
      title: 'Account Scheduled for Deletion',
      description: 'Your account will be deleted after 30 days from this date. You can login back to restore your account.',
    );
  }
}