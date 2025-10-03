import 'package:chaoflutter/page/home/Home_Screen.dart';
import 'package:chaoflutter/page/week1/Screen_Week1.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenWeek1(),
    );
  }
}
