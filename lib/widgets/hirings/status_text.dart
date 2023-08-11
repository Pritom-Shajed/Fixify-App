import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class HiringStatusText extends StatelessWidget {
  final String status;
  final double? fontSize;
  final double? iconSize;
  final double? outerRadiusSize;
  const HiringStatusText({Key? key, required this.status, this.fontSize, this.iconSize, this.outerRadiusSize, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: MediumText(
              fontWeight: FontWeight.w600,
              text: status,
              fontSize: fontSize,
              color: (() {
                if (status == 'on progress'.toUpperCase()) {
                  return AppColors.primaryColor;
                } else if(status == 'confirmed'.toUpperCase()) {
                  return AppColors.positiveColor;
                } else {
                  return AppColors.negativeColor;
                }
              }()),
            )),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        ((){
          if (status == 'on progress'.toUpperCase()) {
            return CircleAvatar(
              radius: outerRadiusSize ?? Dimensions.radius12*0.8,
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                  Icons.access_time_outlined,
                  size: iconSize ?? Dimensions.icon15,
                  color: AppColors.whiteColor
              ),
            );
          } else if(status == 'confirmed'.toUpperCase()) {
            return CircleAvatar(
              radius:outerRadiusSize ??  Dimensions.radius12*0.8,
              backgroundColor: AppColors.positiveColor,
              child: Icon(
                  Icons.check,
                  size: iconSize ?? Dimensions.icon15,
                  color: AppColors.whiteColor
              ),
            );
          } else {
            return CircleAvatar(
              radius:outerRadiusSize ?? Dimensions.radius12*0.8,
              backgroundColor: AppColors.negativeColor,
              child: Icon(
                  Icons.close_rounded,
                  size:  iconSize ?? Dimensions.icon15,
                  color: AppColors.whiteColor,
              ),
            );
          }
        }()),
      ],
    );
  }
}
