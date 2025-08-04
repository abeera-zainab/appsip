import 'package:flutter/material.dart';
import 'package:appsip/widgets/success_widget.dart';

class SubmitIssueScreen extends StatelessWidget {
  const SubmitIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessScreenWidget(
      title: 'Issue Submitted Successfully!',
      description: 'Thanks for submitting, our team will have a review and get back to you very soon. ',
    );
  }
}