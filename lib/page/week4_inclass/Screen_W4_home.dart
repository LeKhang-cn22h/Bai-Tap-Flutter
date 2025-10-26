import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenW4Home extends StatefulWidget {
  const ScreenW4Home({super.key});

  @override
  State<ScreenW4Home> createState() => _ScreenW4Home();
}

class _ScreenW4Home extends State<ScreenW4Home> {
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
          const Text('Navigation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          const SizedBox(height: 10),
          const Text("Flutter"),
          SizedBox(height: 20,),
          const Text(
              textAlign: TextAlign.center,
              "su dung go router de chuyen trang và listview de hien  dff sds fs fds fs f sdf f s fs f f f sf sf f s fs fsd ds fsd thi du lieu tui muon"),
          SizedBox(height: 200,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300,50),
                backgroundColor: Colors.blue,
              ),
              onPressed: (){
                context.pushNamed("lazy");
              }, child: Text("PUSH",
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
