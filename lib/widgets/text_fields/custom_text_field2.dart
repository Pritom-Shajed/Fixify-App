import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';

class CustomTextField2 extends StatelessWidget {
  final bool required;
  final String? hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool isEnabled;
  final Icon? prefixIcon;
  final VoidCallback? suffixIconOnTap;

  const CustomTextField2(
      {super.key,
      this.required = true,
      this.controller,
      this.hintText,
      this.textInputType = TextInputType.text,
      this.suffixIcon,
      this.suffixIconOnTap,
      this.prefixIcon,
      this.onTap,
      this.isEnabled = true,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        enabled: isEnabled,
        style: TextStyle(fontSize: Dimensions.font16),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: Dimensions.font12, color: AppColors.greyColor),
          filled: true,
          fillColor: AppColors.mainBgColor,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(Dimensions.radius12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(Dimensions.radius12)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor),
              borderRadius: BorderRadius.circular(Dimensions.radius12)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor),
              borderRadius: BorderRadius.circular(Dimensions.radius12)),
        ),
      ),
    );
  }
}
