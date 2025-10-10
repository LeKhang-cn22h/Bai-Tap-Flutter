import 'package:flutter/material.dart';

import 'Widgets/Week1_avatar.dart';
import 'Widgets/Week1_header.dart';
class ScreenWeek1 extends StatefulWidget {
  const ScreenWeek1({super.key});

  @override
  State<ScreenWeek1> createState() => _ScreenWeek1State();
}

class _ScreenWeek1State extends State<ScreenWeek1> {
  String? name; // có thể null
  String? content; // có thể null
  String? avatar; // có thể null


  void _editProfile() {

    final nameController = TextEditingController(text: name ?? "");
    final contentController = TextEditingController(text: content ?? "");
    final avatarController = TextEditingController(text: avatar ?? "");

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Chỉnh sửa thông tin"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Tên"),
                  ),
                  TextField(
                    controller: contentController,
                    decoration: const InputDecoration(labelText: "Nội dung"),
                  ),
                  TextField(
                    controller: avatarController,
                    decoration: const InputDecoration(labelText: "Đường dẫn ảnh (asset)"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("Hủy")
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      name = nameController.text;
                      content = contentController.text;
                      avatar = avatarController.text;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Lưu")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Week1Header(onEdit: _editProfile),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            avatar !=null && avatar!.isNotEmpty
              ? CircleAvatar(radius: 50, backgroundImage: AssetImage(avatar!))
                : const Week1Avatar(),
            const SizedBox (height: 12),
            Text(
              name ?? "chua co ten",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox (height: 12),
            Text(
              content ?? "chua co noi dung",
              style: const TextStyle(fontSize: 16),
            )
          ]
        )
      )
    );
  }
}
