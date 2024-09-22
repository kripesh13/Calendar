import 'dart:math';
import 'package:flutter/material.dart';


class SpinWheelScreen extends StatefulWidget {
  @override
  _SpinWheelScreenState createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen> {
  double _angle = 0;
  int _currentNumber = 1;

  void _spinWheel(DragUpdateDetails details) {
    setState(() {
      _angle += details.delta.dx / 200;
      _angle = _angle % (2 * pi); // Keep the angle within a full circle

      // Calculate the selected number based on the angle
      final segmentAngle = 2 * pi / 12;
      final normalizedAngle = _angle < 0 ? _angle + 2 * pi : _angle;
      _currentNumber = 12 - (normalizedAngle ~/ segmentAngle);

      if (_currentNumber == 0) {
        _currentNumber = 12;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spin Wheel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onHorizontalDragUpdate: _spinWheel,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedRotation(
                    turns: _angle / (2 * pi),
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    child: CustomPaint(
                      size: Size(300, 300),
                      painter: WheelPainter(),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      width: 10,
                      height: 30,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Selected Number: $_currentNumber',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class WheelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill;
    final double radius = size.width / 2;
    final List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
      Colors.amber,
      Colors.lime,
    ];

    for (int i = 0; i < 12; i++) {
      paint.color = colors[i];
      final double startAngle = (i * 2 * pi) / 12;
      final double sweepAngle = 2 * pi / 12;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      final textAngle = startAngle + sweepAngle / 2;
      final textOffset = Offset(
        radius + (radius * 0.6) * cos(textAngle),
        radius + (radius * 0.6) * sin(textAngle),
      );

      TextPainter(
        text: TextSpan(
          text: '${i + 1}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textDirection: TextDirection.ltr,
      )
        ..layout()
        ..paint(canvas, textOffset);
    }
  }

  @override
  bool shouldRepaint(WheelPainter oldDelegate) {
    return false;
  }
}
