import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenIntro1 extends StatelessWidget {
  const ScreenIntro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image:AssetImage("assets/images/logo.jpg"), width: 200, height: 200),
          const SizedBox(height: 20,),
          Text("UTH SmartTasks", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue
          ),),
          ElevatedButton(onPressed: (){context.pushNamed('intro2');}, child: Text("Get Started"))

        ]
      ),
      ),
    );
  }
}
