import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomSlider(),
        ),
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  final double value = 73;

  const CustomSlider(
      {super.key}); // This should be the current value to display

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$value kg',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: CustomPaint(
            painter: RulerPainter(value: value),
            size: Size(MediaQuery.of(context).size.width, 40),
          ),
        ),
        Slider(
          value: value,
          min: 50,
          max: 100,
          divisions: 50,
          label: value.round().toString(),
          onChanged: (newValue) {
            // Update the value here and call setState if inside a StatefulWidget
          },
        ),
      ],
    );
  }
}

class RulerPainter extends CustomPainter {
  final double value;
  RulerPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    final Paint indicatorPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    // Draw the ruler lines
    for (int i = 0; i <= size.width; i += 10) {
      canvas.drawLine(
        Offset(i.toDouble(), i % 50 == 0 ? 0 : size.height / 2),
        Offset(i.toDouble(), size.height),
        linePaint,
      );
    }

    // Draw the indicator line
    final double indicatorX = (value - 50) / (100 - 50) * size.width;
    canvas.drawLine(
      Offset(indicatorX, 0),
      Offset(indicatorX, size.height),
      indicatorPaint,
    );

    // Draw circles
    canvas.drawCircle(Offset(indicatorX, 0), 5, indicatorPaint);
    canvas.drawCircle(Offset(indicatorX, size.height), 5, indicatorPaint);

    // Draw the dashed line
    // This requires more complex logic to draw a dashed line
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
