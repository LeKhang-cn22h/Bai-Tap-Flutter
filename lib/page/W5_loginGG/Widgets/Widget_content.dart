import 'package:chaoflutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WidgetContent extends StatefulWidget {
  const WidgetContent({super.key});

  @override
  State<WidgetContent> createState() => _WidgetContentState();
}

class _WidgetContentState extends State<WidgetContent> {
  //khởi tạo AuthService để kiểm tra đăng nhập
  final AuthService _auth = AuthService();
  //Trạng thái loading để kiểm tra đăng nhập
  bool _isLoading = false;
  //lưu thông tin user hiện tại để hiển thị
  User? _currentUser;
  @override
  //khởi tạo trạng thái ban đầu trước khi build lên giao diện
  void initState(){
    super.initState();
    //kiểm tra user hiện tại có đăng nhập hay chưa
    _checkCurrentUser();

  }
  //hàm kiểm tra user hiện tại và cập nhật trạng thái
  void _checkCurrentUser(){
    final user = _auth.getCurrentUser();
    if(user!=null){
      setState(()
      {
        _currentUser = user;
      }
      );
    }
  }
  //hàm đăng nhập với google
  Future<void> _signInWithGG() async{
    setState(() {
      _isLoading = true;
    });
  try{
    final user = await _auth.signInWithGoogle();
    setState(() {
      _isLoading = false;
    });
    if(user !=null){
      setState(() {
        _currentUser = user;
      });

    }
  }
  catch{
    setState(() {
      _isLoading = false;
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome"),
        Text("Ready to explore? Login in to get started"),
        ElevatedButton(onPressed: (){}, child: Text("Login"))

      ],
    );
  }
}
