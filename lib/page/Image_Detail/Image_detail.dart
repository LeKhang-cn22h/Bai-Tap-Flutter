import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key});
  final String url ='https://giaothongvantaitphcm.edu.vn/wp-content/uploads/2025/01/Logo-GTVT.png';
  Future<void> _openLink() async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back), color: Colors.blue,),
        title: Text("Text Detail", style: TextStyle(color:Colors.blue),),
        centerTitle: true,
      ),
      body: SafeArea(child: Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/UTH1.jpg',
          width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          InkWell(
            onTap: _openLink,
            child: const Text('Open Link GTVT', style: TextStyle(color: Colors.blue),),
          ),
          SizedBox(height: 20,),
          Image.asset('assets/images/UTH2.jpg',
          width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text("In app")
        ]
      )
      ),
      )
    );
  }
}
