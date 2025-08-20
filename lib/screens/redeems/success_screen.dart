import 'dart:async'; // Import this for timer functionality
import 'package:appsip/screens/main_screen_shell.dart';
import 'package:flutter/material.dart';
import 'package:appsip/widgets/success_widget.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  void initState() {
    super.initState();
   
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    
    Future.delayed(const Duration(seconds: 3), () {
      
      if (mounted) {
       
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainScreenShell(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return const SuccessScreenWidget(
      title: "All Set, You're In!",
      description: "Welcome to the SipSkip team at [Venue Name]. You're all set to start redeeming Skip passes and earning rewards.",
    );
  }
}