import 'package:flutter/material.dart';

import 'Widgets/Widget_content.dart';
import 'Widgets/Widget_logo_login.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Column(
            children: [

            WidgetLogoLogin(),
            const SizedBox(height: 10,),
            WidgetContent(),
          ],
          ),
          Padding(padding: const EdgeInsets.only(bottom: 12),
          child: Text("@UTHSmartTasks", style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5
          ),),
          )
          ]
        )

      )
      ),

    );
  }
}
