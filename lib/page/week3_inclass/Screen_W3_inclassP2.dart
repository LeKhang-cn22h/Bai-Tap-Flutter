import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenW3Inclassp2 extends StatefulWidget {
  const ScreenW3Inclassp2({super.key});

  @override
  State<ScreenW3Inclassp2> createState() => _ScreenW3Inclassp2State();
}

class _ScreenW3Inclassp2State extends State<ScreenW3Inclassp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/images/logo.jpg"),
          ),
          SizedBox(height: 30),
              const Text('Jetpack Compose', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                const SizedBox(height: 10),
              const Text("Flutter"),
              SizedBox(height: 20,),
              const Text(
                  textAlign: TextAlign.center,
                  "Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach. "),
              SizedBox(height: 200,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300,50),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: (){
                    context.goNamed("UiList");
                  }, child: Text("I'm Ready",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),))


        ],

      ),
    );
  }
}
