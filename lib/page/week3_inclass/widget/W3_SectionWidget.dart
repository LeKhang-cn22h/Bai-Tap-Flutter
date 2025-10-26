import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class W3Sectionwidget extends StatelessWidget {
  final String title;
  final String? routeName;
  final String content;
  final Color? color;
  const W3Sectionwidget({super.key,
    // required là giúp cho biến phải có giá trị
    required this.title,
    this.routeName,
    this.color,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(routeName!=null){
          context.pushNamed(routeName!);
        }
      },
        child:Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color ?? Colors.grey[200],
            borderRadius: BorderRadius.circular(10),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
              ),
              SizedBox(height: 5,),
              Text(content)
            ]

          )
        )
        )
    );
  }
}
