import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SceenTextDetail extends StatefulWidget {
  const SceenTextDetail({super.key});

  @override
  State<SceenTextDetail> createState() => _SceenTextDetailState();
}

class _SceenTextDetailState extends State<SceenTextDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back), color: Colors.blue,),
        title: Text("Text Detail", style: TextStyle(color: Colors.blue),),
        centerTitle: true,
        ),
      body: SafeArea(

          child:Center(child:
      RichText(

        text: TextSpan(
          style: const TextStyle(fontSize: 24, color: Colors.black),
          children: [
            const TextSpan(text: 'The '),
            const TextSpan(
              text: 'quick ',
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            const TextSpan(
              text: 'Brown\n',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: 'fox j u m p s '),
            const TextSpan(
              text: 'over\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: 'the '),
            const TextSpan(
              text: 'lazy ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const TextSpan(
              text: 'dog.',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ],
        ),
      )

      ),
      )
    );
  }
}
