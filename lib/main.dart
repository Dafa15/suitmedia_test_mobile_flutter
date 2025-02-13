import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_test_mobile_flutter/app_routes.dart';
import 'package:suitmedia_test_mobile_flutter/core/constant/color_constant.dart';
import 'package:suitmedia_test_mobile_flutter/core/di/injection.dart';
import 'package:suitmedia_test_mobile_flutter/features/detail_user/bloc/save_user_name_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/bloc/get_user_list_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/bloc/selected_user_cubit.dart';

void main() {
  Injection().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<SaveUserNameCubit>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I<SelectedUserCubit>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I<GetUserListCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            headlineLarge: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headlineMedium: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headlineSmall: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyMedium: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorConstant.textColor,
            ),
          ),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2B637B),
          ),
        ),
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.firstScreen,
      ),
    );
  }
}
