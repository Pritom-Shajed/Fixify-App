import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final Color? color;
  final String text;
  const MediumText({Key? key, this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: Dimensions.font16),
    );
  }
}
