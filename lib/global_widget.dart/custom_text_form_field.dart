import 'package:flutter/material.dart';
import 'package:suitmedia_test_mobile_flutter/core/constant/color_constant.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? palindromeController;
  final FormFieldValidator<String>? validator;
  final bool isReadOnly;
  final String hintText;
  final Color? hintColor;
  const CustomTextFormField({
    super.key,
    this.palindromeController,
    this.validator,
    this.isReadOnly = false,
    required this.hintText,
    this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorConstant.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: hintColor ?? ColorConstant.hintColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
        errorStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      controller: palindromeController,
      validator: validator,
      readOnly: isReadOnly,
    );
  }
}
