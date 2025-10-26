import 'package:flutter/material.dart';

import 'widget/w3CLass_body.dart';

class ScreenW3Inclass extends StatefulWidget {
  const ScreenW3Inclass({super.key});

  @override
  State<ScreenW3Inclass> createState() => _ScreenW3InclassState();
}

class _ScreenW3InclassState extends State<ScreenW3Inclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  W3classBody()),
    );
  }
}
