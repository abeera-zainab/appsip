import 'package:flutter/material.dart';
import 'package:appsip/widgets/success_widget.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessScreenWidget(
      
      title: "All Set,You're In!",
      description: "Welcome to the SipSkip team at [Venue Name].You're all set to start reedeming Skip passes and earning reward ",
    );
  }
}