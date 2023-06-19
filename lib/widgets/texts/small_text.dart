import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double fontSize;
  const SmallText({Key? key, this.color, required this.text, this.fontSize = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize == 0 ? Dimensions.font12 : fontSize),
    );
  }
}
