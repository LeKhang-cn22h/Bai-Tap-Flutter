import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'common_auth_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final Map<String, dynamic>? data;
  const ResetPasswordScreen({super.key,required this.data});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonAuthScreen(
      title: "Create New Password",
      subtitle: "Your new password must be different from previous one.",
      fields: [
        TextField(
          controller: passController,
          obscureText: true,
          decoration: const InputDecoration(labelText: "Password"),
        ),
        TextField(
          controller: confirmController,
          obscureText: true,
          decoration: const InputDecoration(labelText: "Confirm Password"),
        ),
      ],
      buttonText: "Next",
      onPressed: () {
        final data={
          'email':widget.data?['email'],
          'code':widget.data?['code'],
          'password':passController.text
        };
        context.pushNamed('confirm',extra: data);
      },
    );
  }
}
