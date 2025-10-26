import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenRowdetail extends StatelessWidget {
  const ScreenRowdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back), color: Colors.blue,),
        title: Text("Row Detail", style: TextStyle(color: Colors.blue),),
        centerTitle: true,
      ),
      body: SafeArea(child:
      Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        children: List.generate(3, (index){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (colIndex) {
              Color boxColor;
              if (colIndex == 1) {
                boxColor = Colors.grey;
              }
              else {
                boxColor = Colors.blue;
              }
              return Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              );
            }));
        }),
      ),
      )
      ),
    );
  }
}
