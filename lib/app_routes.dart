import 'package:flutter/material.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/screen/first_screen.dart';

class AppRoutes {
  static String firstScreen = "/";

  static Map<String, WidgetBuilder> routes = {
    firstScreen: (context) => const FirstScreen(),
  };
}
