import 'package:appsip/screens/redeems_screen.dart';
import 'package:flutter/material.dart';
import 'package:appsip/screens/earnings_screen.dart';
import 'package:appsip/screens/challenges_screen.dart';
import 'package:appsip/screens/invitation_screen.dart';
import 'package:appsip/screens/register_screen.dart';
import 'package:appsip/screens/tell_us_about_yourself_screen.dart';
import 'package:appsip/screens/edit_bank.dart';
import 'package:appsip/screens/success_screen.dart';
import 'package:appsip/widgets/custom_bottom_nav_bar.dart';

class MainScreenShell extends StatefulWidget {
  const MainScreenShell({super.key});

  @override
  State<MainScreenShell> createState() => _MainScreenShellState();
}

class _MainScreenShellState extends State<MainScreenShell> {
  int _selectedIndex = 1; // Corresponds to 'Earnings'

  final List<Widget> _screens = [
    
    const RedeemsScreen(),
    const EarningsScreen(),
    const ChallengesScreen(),
    const Center(child: Text("Profile Screen")), // Placeholder for Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}