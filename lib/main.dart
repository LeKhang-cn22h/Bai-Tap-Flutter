import 'package:chaoflutter/page/thuvien/controller/studen_controller.dart';
import 'package:chaoflutter/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../apps/apps_router.dart';
import 'package:chaoflutter/page/thuvien/controller/book_controller.dart';
import 'package:chaoflutter/page/thuvien/controller/borrow_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "API_KEY",
      appId: "APP_ID",
      messagingSenderId: "SENDER_ID",
      projectId: "PROJECT_ID",
      // Thêm các trường còn thiếu nếu cần
      storageBucket: "STORAGE_BUCKET",
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentController()),
        ChangeNotifierProvider(create: (_) => BookController()),
        ChangeNotifierProxyProvider2<StudentController, BookController, BorrowController>(
          create: (_) => BorrowController(
            studentController: StudentController(),
            bookController: BookController(),
          ),
          update: (_, studentController, bookController, borrowController) =>
              BorrowController(
                studentController: studentController,
                bookController: bookController,
              ),
        ),
        Provider<AuthService>(create: (_) => AuthService()), // Thêm AuthService vào Provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SmartTasks',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}