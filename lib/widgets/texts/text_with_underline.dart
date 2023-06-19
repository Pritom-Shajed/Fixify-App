import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class TextWithUnderline extends StatelessWidget {
  final String text;
  const TextWithUnderline({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 2.0),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.greyColor)),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: Dimensions.font12),
        ));
  }
}
