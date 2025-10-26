import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'common_auth_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const VerifyCodeScreen({super.key, required this.data});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  // Tạo list 5 controller cho 5 ô nhập OTP
  final List<TextEditingController> _otpControllers =
  List.generate(5, (index) => TextEditingController());

  // Hàm lấy giá trị OTP từ các ô
  String getOtpValue() {
    return _otpControllers.map((c) => c.text).join();
  }

  @override
  void dispose() {
    for (var c in _otpControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonAuthScreen(
      title: "Verify Code",
      subtitle: "Enter the 5-digit code we sent to your email.",
      fields: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
                (index) => SizedBox(
              width: 50,
              child: TextField(
                controller: _otpControllers[index],
                keyboardType: TextInputType.number, // bàn phím số
                textAlign: TextAlign.center,
                maxLength: 1,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  counterText: "", // ẩn số đếm ký tự
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  // Tự động chuyển focus sang ô tiếp theo khi nhập
                  if (value.isNotEmpty && index < 4) {
                    FocusScope.of(context).nextFocus();
                  }
                  // Tự động lùi lại khi xóa
                  if (value.isEmpty && index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
              ),
            ),
          ),
        ),
      ],
      buttonText: "Next",
      onPressed: () {
        final otp = getOtpValue();
        final data = {
          'email': widget.data['email'],
          'code': otp,
        };
        context.pushNamed('reset', extra: data);
      },
    );
  }
}
