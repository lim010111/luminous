import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomPaint(
            size: const Size(200, 200),
            painter: MyCircularTimerPainter(),
          ),
        ),
      ),
    );
  }
}

class MyCircularTimerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    // Draw the background circle
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    // Draw the segments
    paint.color = Colors.orange;
    canvas.drawArc(
      Rect.fromCenter(
        center: size.center(Offset.zero),
        width: size.width,
        height: size.height,
      ),
      -pi / 2, // Start from top
      pi / 4, // Sweep angle for the arc
      false,
      paint,
    );

    paint.color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: size.center(Offset.zero),
        width: size.width,
        height: size.height,
      ),
      -pi / 2 + pi / 4,
      pi,
      false,
      paint,
    );

    // Add more segments as needed...

    // Draw the center text
    TextSpan span =
        TextSpan(style: TextStyle(color: Colors.blue[800]), text: '10시간 0분');
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(
        canvas, size.center(Offset.zero) - Offset(tp.width / 2, tp.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
