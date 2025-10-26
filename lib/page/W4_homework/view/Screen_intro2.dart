import 'package:chaoflutter/page/W4_homework/model/intro_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/intro_widgets.dart';

class ScreenIntro2 extends StatefulWidget {
  const ScreenIntro2({super.key});

  @override
  State<ScreenIntro2> createState() => _ScreenIntro2State();
}

class _ScreenIntro2State extends State<ScreenIntro2> {
  int numberPage=0;
  // tạo controller để điều hướng page
  final PageController _pageController = PageController();
  final List<intro_model> _data=[
    intro_model(
        image: "assets/images/intro1.jpg",
        title: "Easy Time Management",
        content:"With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first "
    ),
    intro_model(image: "assets/images/intro2.jpg",
        title: "Increase Work Effectiveness",
        content: "Time management and the determination of more important tasks will give your job statistics better and always improve"),
    intro_model(image: "assets/images/intro3.jpg",
        title: "Reminder Notification",
        content: "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: (){
          context.pushNamed('home');
        }, child: const Text("skip", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),))
      ]),
        body: PageView.builder(
          // dùng controller để điều hướng page
          controller: _pageController,
          //dùng để hiển thị page theo index
          itemCount: _data.length,
          // dùng để điều hướng page
          onPageChanged: (index)=>setState(()=>numberPage = index),
          // dùng để hiển thị page
          itemBuilder: (context, index)=>
              IntroWidgets(data: _data[index]),
        ),
        bottomSheet:SafeArea(child:
        Container(
          height: 100,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                List.generate(_data.length, (i){
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(5),
                    height: 8,
                    width: numberPage==i? 20:8,
                    decoration: BoxDecoration(
                        color: numberPage==i? Colors.blue:Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    if (numberPage>0){
                      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);};
                  }, icon: Icon(Icons.arrow_back_ios, color: Colors.blue,)),
                  ElevatedButton(
                    onPressed: (){
                      if (numberPage==_data.length-1){
                        context.pushNamed('home');
                      }else{
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Text(numberPage==_data.length-1?'Get Started' :'Next'),
                  )
                ],
              )


            ],
          ),
        ),
        )
    );
  }
}
