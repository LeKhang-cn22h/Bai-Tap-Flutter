import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenTextfield extends StatefulWidget {
  const ScreenTextfield({super.key});

  @override
  State<ScreenTextfield> createState() => _ScreenTextfieldState();
}

class _ScreenTextfieldState extends State<ScreenTextfield> {
  final TextEditingController _controller = TextEditingController();
  String _text = ""; // Chuỗi hiển thị

  @override
  void initState() {
    super.initState();
    // Lắng nghe thay đổi trong TextField
    _controller.addListener(() {
      setState(() {
        _text = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Giải phóng bộ nhớ
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
        title: const Text("Text Field", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller, // gắn controller
                decoration: InputDecoration(
                  hintText: "Nhập thông tin...",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _text.isEmpty
                    ? "Tự động cập nhật theo text field"
                    : _text, //  Hiển thị nội dung nhập
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
