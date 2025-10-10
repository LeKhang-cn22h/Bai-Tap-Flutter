import 'package:chaoflutter/page/week2_checkold/widget/Checkold_body.dart';
import 'package:flutter/material.dart';

class ScreenCheckold extends StatefulWidget {
  const ScreenCheckold({super.key});

  @override
  State<ScreenCheckold> createState() => _ScreenCheckoldState();
}

class _ScreenCheckoldState extends State<ScreenCheckold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  CheckoldBody()),
    );
  }
}
