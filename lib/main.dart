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
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentController()),
        ChangeNotifierProvider(create: (_) => BookController()),
        ChangeNotifierProxyProvider2<StudentController, BookController, BorrowController>(
          create: (_) => BorrowController(),
          update: (_, studentController, bookController, borrowController) {
            borrowController!.update(studentController, bookController);
            return borrowController;
          },
        ),
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class BorrowController extends ChangeNotifier {
  late StudentController studentController;
  late BookController bookController;

  BorrowController();

  void update(StudentController s, BookController b) {
    studentController = s;
    bookController = b;
    notifyListeners();
  }
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