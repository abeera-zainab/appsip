import 'package:flutter/material.dart';
import 'package:appsip/widgets/success_widget.dart';

class ProfileUpdatedScreen extends StatelessWidget {
  const ProfileUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessScreenWidget(
      title: 'Profile Updated Successfully!',
    );
  }
}