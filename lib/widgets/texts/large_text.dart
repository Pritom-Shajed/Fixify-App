import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final Color? color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const LargeText(
      {Key? key,
      this.color,
      required this.text,
      this.fontSize = 0,
      this.fontWeight = FontWeight.normal,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
          color: color,
          fontSize: fontSize == 0 ? Dimensions.font30 : fontSize,

          fontWeight: fontWeight),
    );
  }
}
