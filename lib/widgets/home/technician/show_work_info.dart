import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/large_text.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class ShowWorkInfo extends StatelessWidget {
  final String number;
  final String title;
  final double? fontSizeTitle;
  final String? subtitle;
  const ShowWorkInfo({Key? key, required this.number, required this.title, this.fontSizeTitle, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Dimensions.workInfoContainerWidth,
      height: Dimensions.workInfoContainerHeight,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius:
          BorderRadius.circular(Dimensions.radius4*2),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 5),
                color: AppColors.shadowColor),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LargeText(text: number, fontSize: fontSizeTitle ?? Dimensions.font50,),
             subtitle == null ? Container(): SmallText(text: subtitle!),
            ],
          ),
          SizedBox(height: Dimensions.height5,),
          MediumText(text: title, )
        ],
      ),
    );
  }
}
