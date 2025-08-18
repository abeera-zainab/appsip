import 'package:flutter/material.dart';
import 'package:appsip/widgets/success_widget.dart';

class ChangePasswordUpdatescreen extends StatelessWidget {
  const ChangePasswordUpdatescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessScreenWidget(
      title: 'Password Updated Successfully!',
    );
  }
}