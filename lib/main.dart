import 'package:flutter/material.dart';
import 'package:suitmedia_test_mobile_flutter/app_routes.dart';
import 'package:suitmedia_test_mobile_flutter/core/di/injection.dart';

void main() {
  Injection().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2B637B),
        ),
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.firstScreen,
    );
  }
}
