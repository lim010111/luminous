import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSlider extends StatefulWidget {
  const CircularSlider({super.key});

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  final slider = SleekCircularSlider(
    appearance: const CircularSliderAppearance(),
    onChange: (value) {
      print(value);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: slider,
      ),
    );
  }
}
