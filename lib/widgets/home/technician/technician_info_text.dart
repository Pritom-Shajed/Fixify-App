import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class TechnicianInfoText extends StatelessWidget {
  final String text1;
  final String text2;
  final BorderSide? borderSide;
  final IconData? icon;
  final double fontSize;
  final int? maxLines;

  const TechnicianInfoText(
      {super.key,
      required this.text1,
      this.text2 = 'text2',
      this.borderSide,
      this.icon,
      this.fontSize = 0, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Dimensions.padding15),
      margin: EdgeInsets.only(bottom: Dimensions.padding15),
      decoration: BoxDecoration(
          border: Border(
              bottom: borderSide ??
                  BorderSide(color: AppColors.greyColor.withOpacity(0.1)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MediumText(
                      text: text1,
                      textAlign: TextAlign.start,
                      fontSize: fontSize,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  MediumText(
                    text: ':',
                    textAlign: TextAlign.start,
                    fontSize: fontSize,
                  )
                ],
              )),
          icon == null
              ? Expanded(
                  flex: 3,
                  child: Container(
                      alignment: Alignment.centerRight,
                      width: Dimensions.width10 * 15,
                      child: MediumText(
                        maxLines: maxLines,
                        text: text2,
                        textAlign: TextAlign.right,
                        fontSize: fontSize,
                        color: AppColors.greyColor,
                      )),
                )
              : Icon(icon)
        ],
      ),
    );
  }
}
