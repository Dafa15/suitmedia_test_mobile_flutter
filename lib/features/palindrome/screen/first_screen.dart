import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:suitmedia_test_mobile_flutter/core/constant/image_constant.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/bloc/palindrome_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/widgets/button_section.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/widgets/palindrome_form_section.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _palindromeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<PalindromeCubit>(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                ImageConstant.backgroundFirstScreen,
              ),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.emptyProfile,
                  fit: BoxFit.cover,
                ),
                const Gap(55),
                PalindromeFormSection(
                  palindromeController: _palindromeController,
                ),
                const Gap(45),
                ButtonSection(
                  formKey: _formKey,
                  palindromeController: _palindromeController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
