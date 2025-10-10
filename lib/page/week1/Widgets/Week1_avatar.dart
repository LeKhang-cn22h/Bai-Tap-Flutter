import 'package:flutter/material.dart';

class Week1Avatar extends StatelessWidget {
  const Week1Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage("assets/images/logo.jpg"),
    );
  }
}
