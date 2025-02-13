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
      style: TextStyle(
        color: ColorConstant.textColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor ?? ColorConstant.hintColor,
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
