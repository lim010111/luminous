import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({super.key});

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LinearPercentIndicator(
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 500,
          restartAnimation: true,
          percent: 1,
          width: MediaQuery.of(context).size.width * 0.6,
          lineHeight: 10,
          barRadius: const Radius.circular(10),
        ),
      ),
    );
  }
}
