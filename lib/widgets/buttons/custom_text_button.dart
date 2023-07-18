import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? color;
  final double size;
  final FontWeight? fontWeight;

  const CustomTextButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.color,
      this.fontWeight,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SmallText(
        text: text,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.primaryColor,
      ),
    );
  }
}
