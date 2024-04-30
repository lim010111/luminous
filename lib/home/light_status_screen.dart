import 'package:flutter/material.dart';
import 'package:luminous/auto_mode_screen.dart';
import 'package:luminous/manual_mode_screen.dart';

class LightStatusScreen extends StatefulWidget {
  const LightStatusScreen({super.key});

  @override
  State<LightStatusScreen> createState() => _LightStatusScreenState();
}

class _LightStatusScreenState extends State<LightStatusScreen> {
  bool _autoMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_autoMode ? 'Auto Mode' : 'Manual Mode'),
            Switch(
              activeTrackColor: const Color.fromARGB(255, 64, 64, 64),
              value: _autoMode,
              onChanged: (bool value) {
                setState(() {
                  _autoMode = value;
                });
              },
            ),
          ],
        ),
      ),
      body: AnimatedCrossFade(
        crossFadeState:
            _autoMode ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 140),
        firstChild: const ManualModeScreen(),
        secondChild: const AutoModeScreen(),
      ),
    );
  }
}
