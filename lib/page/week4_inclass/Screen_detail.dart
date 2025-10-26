import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenDetail extends StatelessWidget {
  const ScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.blue,
        ),
        title: const Text("Detail",style: TextStyle(color: Colors.blue),),
        centerTitle: true,
      ),
      body: SafeArea(child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("dya fkafafajflafkadsjfas"),
          SizedBox(height: 20,),
          Container(width: 250,
          height: 350,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text("Noi dung nafy cha ba that laf lonssdsdasdasd dsd sd sd sd sd s ds ds s d sd sd s",
            style: TextStyle(
              fontSize: 30,
            ),),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
              onPressed: (){context.goNamed("home"); }, child: Text("Back to ROOT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
          )
        ],
      ))),

    );
  }
}
