import 'package:chaoflutter/page/week3_inclass/widget/W3_SectionWidget.dart';
import 'package:flutter/material.dart';

class ScreenW3UiList extends StatefulWidget {
  const ScreenW3UiList({super.key});

  @override
  State<ScreenW3UiList> createState() => _ScreenW3UiListState();
}

class _ScreenW3UiListState extends State<ScreenW3UiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("UI List", ),) ,),
      body:
        SingleChildScrollView( child:Padding(padding: EdgeInsets.all(10),
      child:

      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Display", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        SizedBox(height: 10,),
        W3Sectionwidget(title: "Text", content: "display text",routeName: "textDetail",),
        SizedBox(height: 4,),
        W3Sectionwidget(title: "Image", content: "Display an image",routeName: "imageDetail",),
        SizedBox(height: 30,),
        Text("Input", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        SizedBox(height: 10,),
        W3Sectionwidget(title: "Text field", content: "input field for text", routeName: "TextfieldDetail",),
        SizedBox(height: 4,),

        W3Sectionwidget(title: "Password field", content: "input field for password", routeName: "passwordFieldDetail",),
        SizedBox(height: 30,),
        Text("Layout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        SizedBox(height: 10,),
        W3Sectionwidget(title: "Column", content: "Arranges elements vertically",routeName: "columnDetail"),
        SizedBox(height: 4,),
        W3Sectionwidget(title: "Row", content: "Arranges elements horizontally",routeName: "rowDetail",),
        SizedBox(height: 4,),
        W3Sectionwidget(title: "Tự tìm hiểu", content: "Tìm ra tất cả các thành phần Ui cơ bản",routeName: "moreDetail",color: Colors.red[200],)

        ])
        )
        )
    );
  }
}
