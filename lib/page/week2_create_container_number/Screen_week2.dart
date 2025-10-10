import 'package:flutter/material.dart';

import 'Widgets/Week2_body.dart';

class ScreenWeek2 extends StatefulWidget {
  const ScreenWeek2({super.key});

  @override
  State<ScreenWeek2> createState() => _ScreenWeek2State();
}

class _ScreenWeek2State extends State<ScreenWeek2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  Week2Body()),
    );
  }
}
