import 'package:flutter/material.dart';
import 'package:suitmedia_test_mobile_flutter/features/detail_user/screen/second_screen.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/screen/first_screen.dart';

class AppRoutes {
  static String firstScreen = "/";
  static String secondScreen = "/second";

  static Map<String, WidgetBuilder> routes = {
    firstScreen: (context) => const FirstScreen(),
    secondScreen: (context) => const SecondScreen(),
  };
}
