import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class ClockView extends StatefulWidget {
  final double size;

  ClockView({this.size});
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime datetime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.width / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;

    var centerFillBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..strokeWidth = 16;
    var secHandBrush = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;
    var minHandBrush = Paint()
      ..color = Colors.orange[300]
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Color(0xFF48EFF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 30;
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange[300]
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 24;
    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);
    var hourHandX = centerX +
        radius *
            0.4 *
            cos((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    var hourHandY = centerY +
        radius *
            0.4 *
            sin((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + radius * 0.6 * cos(datetime.minute * 6 * pi / 180);
    var minHandY = centerX + radius * 0.6 * sin(datetime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX =
        centerX + radius * 0.12 * cos(datetime.second * 6 * pi / 180);
    var secHandY =
        centerY + radius * 0.12 * sin(datetime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);
    var outerCircleRadius = radius;
    var innerCirleRadius = radius * 0.9;
    for (var i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);
      var x2 = centerX + innerCirleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCirleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
