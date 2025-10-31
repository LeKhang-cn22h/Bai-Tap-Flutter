import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_field.dart';

class ProfileScreen extends StatefulWidget {
  final User? user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? _user = FirebaseAuth.instance.currentUser; // 🔥 Lấy user hiện tại

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController dobController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: _user?.displayName ?? '');
    emailController = TextEditingController(text: _user?.email ?? '');
    dobController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white), // 🔹 icon trắng
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.blue, // chữ trắng
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ProfileAvatar(photoUrl: _user?.photoURL), // ✅ truyền ảnh từ Firebase
            const SizedBox(height: 30),

            ProfileField(label: "Name", controller: nameController),
            const SizedBox(height: 15),

            ProfileField(label: "Email", controller: emailController, readOnly: true),
            const SizedBox(height: 15),

            ProfileField(
              label: "Date of Birth",
              controller: dobController,
              isDate: true,
              onDatePick: (picked) {
                if (picked != null) {
                  dobController.text =
                  "${picked.year}-${picked.month}-${picked.day}";
                }
              },
            ),
            const SizedBox(height: 250),
            ElevatedButton(onPressed: (){
              context.pop();
            }, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
                child: Text("Back",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),))
          ],
        ),
      ),
    );
  }
}
