import 'package:chaoflutter/page/week3_inclass/Screen_W3_inclassP2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../page/Column_detail/Screen_columnDetail.dart';
import '../page/Image_Detail/Image_detail.dart';
import '../page/Pass_detail/Screen_passField.dart';
import '../page/Row_detail/Screen_rowDetail.dart';
import '../page/TextField_detail/Screwn_Textfield.dart';
import '../page/Text_Detail/Sceen_Text_detail.dart';
import '../page/W4_homework/view/Screen_intro1.dart';
import '../page/W4_homework/view/Screen_intro2.dart';
import '../page/dataFlow/View/confirm_screen.dart';
import '../page/dataFlow/View/forget_password_screen.dart';
import '../page/dataFlow/View/reset_password_screen.dart';
import '../page/dataFlow/View/verify_code_screen.dart';
import '../page/thuvien/view/Screen_book.dart';
import '../page/thuvien/view/Screen_home.dart';
import '../page/thuvien/view/Screen_student.dart';
import '../page/thuvien/view/main_library_screen.dart';
import '../page/week3_inclass/Screen_W3_UI_List.dart';
import '../page/week4_inclass/Screen_W4_home.dart';
import '../page/week4_inclass/Screen_detail.dart';
import '../page/week4_inclass/Screen_lazyload.dart';
import '../services/Screen_login.dart';

final GoRouter appRouter =GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      // GoRoute(
      //   path: '/',
      //   name: 'forget',
      //   builder: (context, state) {
      //     final data = state.extra as Map<String, dynamic>?;
      //     return ForgetPasswordScreen(data: data);
      //   },
      // ),
      GoRoute(
        path: '/verify',
        name: 'verify',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return VerifyCodeScreen(data: data);
        },
      ),
      GoRoute(
        path: '/reset',
        name: 'reset',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ResetPasswordScreen(data: data);
        },
      ),
      GoRoute(
        path: '/confirm',
        name: 'confirm',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ConfirmScreen(data: data);
        },
      ),

// bai thu vien
//   GoRoute(
//     path: '/',
//     builder: (context, state) => const MainLibraryScreen(),
//   ),

// Route danh sách sách
  GoRoute(
    path: '/books',
    builder: (context, state) => const BookListScreen(),
  ),

// Route chi tiết sinh viên - có tham số động
  GoRoute(
    path: '/student/:id',
    builder: (context, state) {
      final studentId = state.pathParameters['id']!;
      return StudentBooksScreen(studentId: studentId);
    },
  ),
  // GoRoute(path: '/',
  // name: 'intro',
  // builder: (context,state)=>const ScreenIntro1()
  // ),
  GoRoute(path: '/intro2',
  name: 'intro2',
  builder: (context,state)=>const ScreenIntro2()),
  GoRoute(path: '/HOME',
  name: 'home',
builder: (context,state)=>const ScreenW4Home()
  ),
  GoRoute(path: '/UIList',
  name: 'UiList',
  builder: (context,state)=>const ScreenW3UiList()
  ),
  GoRoute(path: '/textDetail',
  name: 'textDetail',
  builder: (context,state)=>const SceenTextDetail()
  ),
  GoRoute(path: '/imageDetail',
  name: 'imageDetail',
  builder: (context,state)=>const ImageDetail()
  ),
  GoRoute(path: '/TextfieldDetail',
  name: 'TextfieldDetail',
    builder: (context,state)=>const ScreenTextfield()

  ),
  GoRoute(path: '/passwordFieldDetail',
  name:'passwordFieldDetail',
    builder: (context,state)=>const ScreenPasswordField()
  ),
  GoRoute(path: '/columnDetail',
  name: 'columnDetail',
  builder: (context,state)=>const ScreenColumndetail()
  ),
  GoRoute(path: '/rowDetail',
  name: 'rowDetail',
    builder: (context, state)=>const ScreenRowdetail()
  ),
  GoRoute(path: '/lazy',
  name: 'lazy',
    builder: (context,state)=>const ScreenLazyload()

  ),
  GoRoute(path: '/detail',
  name: 'detail',
    builder: (context,state)=>const ScreenDetail()
  ),
  GoRoute(path: '/root',
  name: 'root',
builder: (context,state)=>const ScreenW4Home()),
  GoRoute(path: '/homeW3P2',
  name:'W3P2',
builder: (context,state)=>const ScreenW3Inclassp2())


],
    errorBuilder: (context,state)=>const Scaffold(
body: Center(
child: Text("khong tim thay trang"),
),
)
);
