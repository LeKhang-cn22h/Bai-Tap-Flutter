import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'common_auth_screen.dart';

class ConfirmScreen extends StatelessWidget {
  final Map<String, dynamic>? data;
  const ConfirmScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    // Tạo controller cho từng TextField và gán dữ liệu từ map
    final emailController = TextEditingController(text: data?['email'] ?? '');
    final codeController = TextEditingController(text: data?['code'] ?? '');
    final passController = TextEditingController(text: data?['password'] ?? '');

    return CommonAuthScreen(
      title: "Confirm",
      subtitle: "We are here to help you!",
      fields: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: "Email"),
          readOnly: true,
        ),
        TextField(
          controller: codeController,
          decoration: const InputDecoration(labelText: "Verification Code"),
          readOnly: true,
        ),
        TextField(
          controller: passController,
          decoration: const InputDecoration(labelText: "Password"),
          readOnly: true,
        ),
      ],
      buttonText: "Submit",
      onPressed: () {
        context.goNamed('forget',extra: data);
      },
    );
  }
}
