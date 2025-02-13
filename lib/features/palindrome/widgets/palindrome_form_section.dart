import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:suitmedia_test_mobile_flutter/core/constant/color_constant.dart';
import 'package:suitmedia_test_mobile_flutter/features/palindrome/bloc/palindrome_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/global_widget.dart/custom_text_form_field.dart';

class PalindromeFormSection extends StatelessWidget {
  const PalindromeFormSection({
    super.key,
    required TextEditingController palindromeController,
  }) : _palindromeController = palindromeController;

  final TextEditingController _palindromeController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalindromeCubit, String>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFormField(
              palindromeController: _palindromeController,
              hintText: 'Name',
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Name cannot be empty!";
                }
                return null;
              },
            ),
            const Gap(16),
            CustomTextFormField(
              isReadOnly: true,
              hintColor: state != "Palindrome"
                  ? ColorConstant.textColor
                  : ColorConstant.hintColor,
              hintText: context.watch<PalindromeCubit>().state,
            ),
          ],
        );
      },
    );
  }
}
