import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class TextWithStar extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final TextDecoration textDecoration;
  final double starIconSize;
  final bool starEnable;
  const TextWithStar(
      {super.key,
      required this.text,
      this.textDecoration = TextDecoration.none,
      this.color = const Color(0xff333339),
      this.fontSize = 0,
      this.starIconSize = 0,
      this.starEnable=true});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: text,
            style: TextStyle(
                color: AppColors.blackColor, fontSize: fontSize == 0? Dimensions.font14: fontSize),
            children: [
           starEnable == true ? TextSpan(
              text: '*',
              style: TextStyle(
                  color: AppColors.redColor, fontSize: starIconSize == 0? Dimensions.font14:starIconSize)): const TextSpan()
        ]));
  }
}
