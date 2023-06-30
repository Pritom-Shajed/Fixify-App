import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String titleText;
  final bool required;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool isEnabled;
  final Icon? prefixIcon;
  final VoidCallback? suffixIconOnTap;

  const CustomTextFormField(
      {super.key,
      required this.titleText,
      this.required = true,
      this.controller,
      required this.hintText,
      this.textInputType = TextInputType.text,
      this.suffixIcon,
      this.suffixIconOnTap,
      this.prefixIcon,
      this.onTap,
      this.isEnabled = true,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height10,
        ),
        TextWithStar(
          fontSize: Dimensions.font12,
          text: titleText,
          starEnable: required,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        GestureDetector(
          onTap: onTap,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: textInputType,
            enabled: isEnabled,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: Dimensions.font12, color: AppColors.greyColor),
              filled: true,
              fillColor: AppColors.textFieldColor,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(Dimensions.radius4)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(Dimensions.radius4)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius4)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius4)),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
      ],
    );
  }
}
