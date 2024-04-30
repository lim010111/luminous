import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../formulas/temp_to_rgb.dart';

class LightSettingBox extends StatefulWidget {
  final String deviceName;
  const LightSettingBox({
    super.key,
    required this.deviceName,
  });

  @override
  State<LightSettingBox> createState() => _LightSettingBoxState();
}

class _LightSettingBoxState extends State<LightSettingBox>
    with TickerProviderStateMixin {
  double _temperatureValue = 7500;
  double _brightnessValue = 255;

  // final bool _isPowerOn = false;

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final AnimationController _blubColorController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );

  late final AnimationController _bulbRotationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  late final AnimationController _bulbAboveController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final Animation<Color?> _colorAnimation = ColorTween(
    begin: const Color.fromARGB(255, 255, 255, 255),
    end: const Color.fromARGB(255, 72, 255, 173),
  ).animate(_animationController);

  late final Animation<Color?> _bulbColorAnimation = ColorTween(
    begin: const Color.fromARGB(255, 136, 136, 136),
    end: const Color.fromARGB(255, 255, 241, 86),
  ).animate(_blubColorController);

  late final Animation<double> _bulbRotationAnimation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(_bulbRotationController);

  late final Animation<Offset> _blubAboveAnimaion = Tween(
    begin: const Offset(0, 0.1),
    end: const Offset(0, -0.2),
  ).animate(_bulbAboveController);

  void _onPowerSwitchTap() async {
    // Color
    if (_animationController.isCompleted) {
      _animationController.reverse();
      _blubColorController.reverse();
      // BulbAnmation

      _bulbRotationController.reset();
    } else {
      _animationController.forward();
      // BulbAnmation
      await _bulbAboveController.forward();
      if (_bulbAboveController.isCompleted) {
        _blubColorController.forward();
        await _bulbRotationController.forward();

        _bulbAboveController.reverse();
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 54, 54, 54),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4C000000),
            blurRadius: 3,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 35,
              right: 70,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorTempToRGB(
                      _temperatureValue, _brightnessValue.toInt()),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 26,
              child: GestureDetector(
                onTap: _onPowerSwitchTap,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(
                    MdiIcons.power,
                    color: _colorAnimation.value,
                    size: 40,
                    shadows: const [
                      Shadow(
                        color: Color.fromARGB(255, 73, 222, 255),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 20,
              child: SlideTransition(
                position: _blubAboveAnimaion,
                child: RotationTransition(
                  turns: _bulbRotationAnimation,
                  child: Icon(
                    MdiIcons.lightbulb,
                    color: _bulbColorAnimation.value,
                    size: 48,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 65,
              top: 30,
              child: Text(
                widget.deviceName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 85,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 48, 48, 48),
                      offset: Offset(0, 0.5),
                      spreadRadius: 0.4,
                      blurRadius: 0.3,
                    )
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffFF3800),
                      Color(0xffFF844A),
                      Color(0xffFFC489),
                      Color(0xffFFE4CE),
                      Color(0xffFFF9FD),
                      Color(0xffD6E1FF),
                    ],
                    stops: [0, 0.19, 0.35, 0.50, 0.65, 1],
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 60,
              left: 29,
              child: Text(
                'Color Temperature',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            const Positioned(
              bottom: 13,
              left: 30,
              child: Text(
                'Brightness',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            Positioned(
              bottom: 66,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.77,
                child: Slider(
                  value: _temperatureValue,
                  onChanged: (double value) {
                    setState(() {
                      _temperatureValue = value;
                    });
                  },
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.transparent,
                  thumbColor: Colors.white,
                  max: 7500,
                  min: 1500,
                  divisions: 6000,
                  label: _temperatureValue.toString(),
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.77,
                child: Slider(
                  value: _brightnessValue,
                  onChanged: (double value) {
                    setState(() {
                      _brightnessValue = value;
                    });
                  },
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.transparent,
                  thumbColor: Colors.white,
                  max: 255,
                  min: 0,
                  divisions: 255,
                  label: _brightnessValue.toString(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
