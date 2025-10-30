import 'package:flutter/material.dart';

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
        child: WidgetLogoLogin(),
      )
      ),
    );
  }
}
