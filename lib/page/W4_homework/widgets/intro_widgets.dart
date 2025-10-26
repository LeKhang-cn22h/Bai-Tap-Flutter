import 'package:chaoflutter/page/W4_homework/model/intro_model.dart';
import 'package:flutter/material.dart';

class IntroWidgets extends StatelessWidget {
  // gọi data từ model để hiển thị lên màn hình
  final intro_model data;
  const IntroWidgets({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(data.image, width: 200, height: 200),
        const SizedBox(height: 30,),
        Text(data.title, style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        const SizedBox(height: 30,),
        Text(data.content, style: TextStyle(
          fontSize: 16,
        ),)
        
      ],
    );
  }
}
