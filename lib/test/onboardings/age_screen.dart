import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<String> _fruitNames = <String>[
  for (int i = 1; i < 120; i++) "$i",
];

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int _selectedFruit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              const Positioned(
                right: 170,
                bottom: 110,
                child: Center(
                  child: Text(
                    'Years',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              CupertinoPicker(
                itemExtent: 70,
                onSelectedItemChanged: (int selectedItem) {
                  setState(() {
                    _selectedFruit = selectedItem;
                  });
                },
                children: List<Widget>.generate(
                  _fruitNames.length,
                  (int index) {
                    return Center(
                      child: Text(
                        _fruitNames[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
