import 'package:flutter/material.dart';

import 'widget/checkEmail_body.dart';

class ScreenCheckemail extends StatefulWidget {
  const ScreenCheckemail({super.key});

  @override
  State<ScreenCheckemail> createState() => _ScreenCheckemailState();
}

class _ScreenCheckemailState extends State<ScreenCheckemail> {
  @override
  Widget build(BuildContext context) {
    return CheckemailBody();
  }
}
