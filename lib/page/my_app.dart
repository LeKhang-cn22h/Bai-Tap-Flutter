import 'package:chaoflutter/page/week1/Screen_Week1.dart';
import 'package:chaoflutter/page/week2_checkEmail/Screen_checkEmail.dart';
import 'package:chaoflutter/page/week2_checkold/Screen_checkold.dart';
import 'package:chaoflutter/page/week2_create_container_number/Screen_week2.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScreenCheckemail(),
    );
  }
}
