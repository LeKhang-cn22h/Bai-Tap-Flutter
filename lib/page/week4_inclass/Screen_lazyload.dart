import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenLazyload extends StatefulWidget {
  const ScreenLazyload({super.key});

  @override
  State<ScreenLazyload> createState() => _ScreenLazyloadState();
}

class _ScreenLazyloadState extends State<ScreenLazyload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton (
          onPressed: (){
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.blue,
        ),
        title: const Text(""
            "Lazy Load", style: TextStyle(color: Colors.blue),),
        centerTitle: true,
      ),
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(16),
          child: ListView.separated(
              itemCount:1000,
              separatorBuilder: (context,index)=>SizedBox(height:12),
              itemBuilder: (context,index){
              return Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded (child: Text('$index đây là dòng text dài dòng Đây là một đoạn văn bản dài và được căn giữa khi rớt dòng.',softWrap: true,overflow: TextOverflow.visible,),),
                    IconButton(onPressed: (){ context.pushNamed("detail");}, icon: Icon(Icons.navigate_next_outlined))

                  ],
              ),
              );


              }
      )),
    ));
  }
}
