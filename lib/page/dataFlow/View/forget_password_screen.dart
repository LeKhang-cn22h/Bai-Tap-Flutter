import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'common_auth_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final Map<String, dynamic>? data; // dữ liệu truyền từ màn hình trước
  const ForgetPasswordScreen({super.key, this.data});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.data?['email'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    final hasData = data != null &&
        (data['email'] != null ||
            data['code'] != null ||
            data['password'] != null);

    return CommonAuthScreen(
      title: hasData ? "Confirm Information" : "Forget Password?",
      subtitle: hasData
          ? "Please check your information below:"
          : "Enter your Email, we’ll send you a verification code.",
      fields: [
        if (hasData)
        // Trường hợp có dữ liệu -> hiển thị text read-only
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email: ${data['email'] ?? 'Không có'}",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text("Verification Code: ${data['code'] ?? 'Không có'}",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text("Password: ${data['password'] ?? 'Không có'}",
                  style: const TextStyle(fontSize: 16)),
            ],
          )
        else
        //  Không có dữ liệu -> hiển thị TextField cho người dùng nhập
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: "Your Email"),
          ),
      ],
      buttonText: hasData ? "Confirm" : "Next",
      onPressed: () {
        if (hasData) {
          // Nếu có dữ liệu thì xác nhận xong chuyển tới home
          context.goNamed('home');
        } else {
          // Nếu chưa có dữ liệu -> lấy email và chuyển sang màn xác nhận (verify)
          final data = {'email': emailController.text};
          context.pushNamed('verify', extra: data);
        }
      },
    );
  }
}
