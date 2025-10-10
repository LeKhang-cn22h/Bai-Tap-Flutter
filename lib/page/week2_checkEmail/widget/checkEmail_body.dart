import 'package:flutter/material.dart';

class CheckemailBody extends StatefulWidget {
  const CheckemailBody({super.key});

  @override
  State<CheckemailBody> createState() => _CheckemailBodyState();
}

class _CheckemailBodyState extends State<CheckemailBody> {
  final TextEditingController _emailController = TextEditingController();
  String? _loi;

  void CheckMail() {
    String email = _emailController.text.trim();
    setState(() {
      if (email.isEmpty) {
        _loi = "Vui lòng nhập email!";
      } else if (!email.contains("@")) {
        _loi = "Email không đúng định dạng (thiếu @)";

      } else {
        _loi = "Email hợp lệ!";

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Thực hành 02",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 20),

              // TextField với bo góc mượt và không viền
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Nhập email...",
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none, // Ẩn viền
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Nếu có lỗi thì hiển thị dòng chữ đỏ
              if (_loi != null) ...[
                Text(
                  _loi!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
                const SizedBox(height: 10),
              ],

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: CheckMail,
                child: const Text(
                  "Check",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
