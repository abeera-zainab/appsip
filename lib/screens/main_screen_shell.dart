import 'package:flutter/material.dart';
import 'package:appsip/screens/redeems_screen.dart';
import 'package:appsip/screens/earnings_screen.dart';
import 'package:appsip/screens/challenges_screen.dart';
import 'package:appsip/widgets/custom_bottom_nav_bar.dart';

class MainScreenShell extends StatefulWidget {
  const MainScreenShell({super.key});

  @override
  State<MainScreenShell> createState() => _MainScreenShellState();
}

class _MainScreenShellState extends State<MainScreenShell> {
  int selectedIndex = 0; // Default to 'Earnings' screen

  // Screens corresponding to each bottom navigation item
  final List<Widget> _screens = const [
    RedeemsScreen(),
    EarningsScreen(),
    ChallengesScreen(),
    Center(child: Text("Profile Screen")), // Placeholder for Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}