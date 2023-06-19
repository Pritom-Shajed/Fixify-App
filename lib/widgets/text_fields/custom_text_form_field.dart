import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController? controller;
  final Icon? suffixIcon;
  final VoidCallback? onTap;
  final bool isEnabled;

  final FormFieldValidator<String>? validator;

  const CustomTextFormField(
      {super.key,
        this.validator,
        this.controller,
        required this.hintText,
        this.textInputType = TextInputType.text,
        this.suffixIcon,
        this.onTap,
        this.isEnabled = true,
        this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      validator: validator,
      enabled: isEnabled,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle:
        TextStyle(fontSize: Dimensions.font12, color: AppColors.greyColor),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(4)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(4)),
        errorStyle: TextStyle(color: AppColors.redColor),
        enabledBorder: UnderlineInputBorder(
            borderSide:  BorderSide(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(4)),
        focusedBorder: UnderlineInputBorder(
            borderSide:  BorderSide(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(4)),
      ),
      onTap: onTap,
    );
  }
}