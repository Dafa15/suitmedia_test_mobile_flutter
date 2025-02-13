import 'package:get_it/get_it.dart';
import 'package:suitmedia_test_mobile_flutter/core/network/api_client.dart';
import 'package:suitmedia_test_mobile_flutter/data/repositories/user_repository.dart';
import 'package:suitmedia_test_mobile_flutter/features/detail_user/bloc/save_user_name_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/bloc/palindrome_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/bloc/get_user_list_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/bloc/selected_user_cubit.dart';

class Injection {
  final di = GetIt.instance;
  void init() {   
    // Register Repository
    di.registerLazySingleton<UserRepository>(() => UserRepository(di()));

    // Register ApiClient
    di.registerLazySingleton(() => ApiClient());
    
    // Register Cubit
    di.registerFactory<PalindromeCubit>(() => PalindromeCubit());
    di.registerLazySingleton<SaveUserNameCubit>(() => SaveUserNameCubit());
    di.registerLazySingleton<GetUserListCubit>(() => GetUserListCubit());
    di.registerLazySingleton<SelectedUserCubit>(() => SelectedUserCubit());

  }
}