import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:suitmedia_test_mobile_flutter/app_routes.dart';
import 'package:suitmedia_test_mobile_flutter/features/detail_user/bloc/save_user_name_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/bloc/palindrome_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/global_widget.dart/custom_button.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController palindromeController,
  })  : _formKey = formKey,
        _palindromeController = palindromeController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _palindromeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PalindromeCubit, String>(
          builder: (context, state) {
            return CustomButton(
              text: 'CHECK',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<PalindromeCubit>().isPalindrome(
                        text: _palindromeController.text,
                      );
                }
              },
            );
          },
        ),
        const Gap(16),
        CustomButton(
          text: 'NEXT',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<SaveUserNameCubit>().saveUserName(
                    userName: _palindromeController.text,
                  );
              Navigator.pushNamed(
                context,
                AppRoutes.secondScreen,
              );
            }
          },
        )
      ],
    );
  }
}
