import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const SmallText(
      {Key? key,
      this.color,
      required this.text,
      this.fontSize = 0,
      this.fontWeight = FontWeight.normal, this.textAlign, this.maxLines, this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 2,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        overflow: textOverflow ?? TextOverflow.ellipsis,
          fontWeight: fontWeight,
          color: color,
          fontSize: fontSize == 0 ? Dimensions.font12 : fontSize),
    );
  }
}
