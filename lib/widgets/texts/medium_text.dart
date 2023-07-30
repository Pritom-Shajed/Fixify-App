import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final Color? color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int?  maxLines;
  final TextOverflow? textOverflow;

  const MediumText(
      {Key? key,
      this.color,
        this.maxLines,
        this.textOverflow,
      required this.text,
      this.fontSize = 0,
      this.fontWeight = FontWeight.normal, this.textAlign, this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines ?? 2,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        letterSpacing: letterSpacing,
          color: color,
          fontSize: fontSize == 0 ? Dimensions.font16 : fontSize,
          fontWeight: fontWeight),
    );
  }
}
