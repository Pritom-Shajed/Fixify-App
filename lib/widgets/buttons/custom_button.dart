import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.padding5 * 1.5,
            horizontal: Dimensions.padding10),
        decoration: BoxDecoration(
            color: color ?? AppColors.buttonColor,
            borderRadius: BorderRadius.circular(Dimensions.radius4 * 2)),
        child: SmallText(
          text: text,
          color: textColor ?? AppColors.whiteColor,
        ),
      ),
    );
  }
}
