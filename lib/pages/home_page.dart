import 'package:clock_app/widgets/clock_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF2d2f41),
        child: ClockView(),
      ),
    );
  }
}
