import 'package:flutter/material.dart';
import 'package:luminous/health_screen.dart';
import 'package:luminous/notification_screen.dart';
import 'package:luminous/home_screen.dart';
import 'package:luminous/settings_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<Widget> _destinations = [
    NavigationDestination(
      icon: Icon(MdiIcons.homeOutline),
      selectedIcon: Icon(MdiIcons.home),
      label: "Home",
    ),
    NavigationDestination(
      icon: Icon(MdiIcons.heartOutline),
      selectedIcon: Icon(MdiIcons.heart),
      label: "Health",
    ),
    NavigationDestination(
      icon: Icon(MdiIcons.bellOutline),
      selectedIcon: Icon(MdiIcons.bell),
      label: "Notifications",
    ),
    NavigationDestination(
      icon: Icon(MdiIcons.cogOutline),
      selectedIcon: Icon(MdiIcons.cog),
      label: "Settings",
    ),
  ];

  final List<Widget> _screen = [
    const HomeScreen(),
    const HealthScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
  ];

  int _currentIndex = 0;

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: NavigationBar(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        indicatorColor: Colors.transparent,
        destinations: _destinations,
        onDestinationSelected: _onNavigationTap,
        selectedIndex: _currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
