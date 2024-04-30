import 'package:flutter/material.dart';
import 'package:luminous/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainNavigationScreen(),
    );
  }
}
