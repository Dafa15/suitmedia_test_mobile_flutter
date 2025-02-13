import 'package:get_it/get_it.dart';
import 'package:suitmedia_test_mobile_flutter/features/detail_user/bloc/save_user_name_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/bloc/palindrome_cubit.dart';

class Injection {
  final di = GetIt.instance;
  void init() {    
    // Register Cubit
    di.registerFactory<PalindromeCubit>(() => PalindromeCubit());
    di.registerLazySingleton<SaveUserNameCubit>(() => SaveUserNameCubit());

  }
}