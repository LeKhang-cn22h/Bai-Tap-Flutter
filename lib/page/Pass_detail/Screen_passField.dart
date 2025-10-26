import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPasswordField extends StatefulWidget {
  const ScreenPasswordField({super.key});

  @override
  State<ScreenPasswordField> createState() => _ScreenPasswordFieldState();
}

class _ScreenPasswordFieldState extends State<ScreenPasswordField> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true; // ẩn/hiện mật khẩu

  @override
  void dispose() {
    _passwordController.dispose(); // Giải phóng bộ nhớ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop(); // Quay lại
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.blue,
        ),
        title: const Text("Password Field", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _passwordController,
                obscureText: _isObscure, // Ẩn ký tự nhập
                decoration: InputDecoration(
                  hintText: "Nhập mật khẩu...",
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure; // Đổi trạng thái hiển thị
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _passwordController.text.isEmpty
                    ? "Mật khẩu đang ẩn đi"
                    : "Bạn đã nhập ${_passwordController.text.length} ký tự",
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
