
import 'package:flutter/material.dart';

import '../apps/apps_router.dart';

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
