import 'package:flutter/material.dart';

class WidgetLogoLogin extends StatelessWidget {
  const WidgetLogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 354,
                child: Image.asset('assets/images/bg.jpg'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                ),
              ),
              Container(
                height: 197,
                width: 202,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFD5EDFF),
                ),
                child: Container(
                  height: 88,
                  width: 128,
                  child:
                Image.asset('assets/images/logouth.jpg',
                fit:BoxFit.contain
                ),)
              ),
              Positioned(
                bottom: 10,
                child:Text ("SmartTasks", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),)
                ,
              )
              ,
            ],
          ),
          const SizedBox(height: 10,),
          Text("A simple and efficient to-do app", style: TextStyle(color: Colors.blue),)
          ]
      )
    );
  }
}
