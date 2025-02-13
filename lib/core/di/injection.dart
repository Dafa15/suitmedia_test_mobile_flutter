import 'package:get_it/get_it.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/cubit/palindrome_cubit.dart';

class Injection {
  final di = GetIt.instance;
  void init() {    
    // Register Cubit
    di.registerFactory<PalindromeCubit>(() => PalindromeCubit());
  }
}