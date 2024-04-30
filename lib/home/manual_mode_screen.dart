import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'widgets/light_setting_box.dart';

class ManualModeScreen extends StatefulWidget {
  const ManualModeScreen({super.key});

  @override
  State<ManualModeScreen> createState() => _ManualModeScreenState();
}

class _ManualModeScreenState extends State<ManualModeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<double> _arrowAnimation =
      Tween(begin: 0.0, end: 0.5).animate(_animationController);

  late final Animation<Offset> _panelAnimation =
      Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
          .animate(_animationController);

  final List<String> _tabs = [
    'Bedroom',
    'My Room 1',
    'My Room 2',
    'My Room 3',
    'My Room 4',
    'My Room 5',
    'My Room 6',
  ];

  void _onArrorTap() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              const Positioned(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    LightSettingBox(deviceName: 'Celing Light'),
                    SizedBox(height: 10),
                    LightSettingBox(deviceName: 'Blinds'),
                    SizedBox(height: 10),
                    LightSettingBox(deviceName: 'Desk'),
                  ],
                ),
              ),
              // ignore: sized_box_for_whitespace
              RotationTransition(
                turns: _arrowAnimation,
                child: GestureDetector(
                  onTap: _onArrorTap,
                  child: Icon(
                    MdiIcons.chevronDown,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: -10,
                child: SlideTransition(
                  position: _panelAnimation,
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    width: 150,
                    child: Column(
                      children: [
                        for (var tab in _tabs)
                          ListTile(
                            title: Text(
                              tab,
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
