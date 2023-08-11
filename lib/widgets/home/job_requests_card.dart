import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class JobRequestCard extends StatelessWidget {
  final VoidCallback onTap;
  final String status;
  final String services;
  final String description;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;

  const JobRequestCard(
      {Key? key,
        required this.onTap,
        required this.services,
        required this.description,
        this.bgColor,
        this.textColor,
        this.iconColor, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding10),
      decoration: BoxDecoration(
          color: bgColor ?? AppColors.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius4 * 2),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 5),
                color: AppColors.shadowColor),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: MediumText(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.font14,
                    text: status,
                    color: (() {
                      if (status == 'on progress'.toUpperCase()) {
                        return AppColors.primaryColor.withOpacity(0.6);
                      } else if(status == 'confirmed'.toUpperCase()) {
                        return AppColors.positiveColor;
                      } else {
                        AppColors.negativeColor;
                      }
                    }()),
                  )),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              Icon(
                Icons.access_time_outlined,
                size: Dimensions.icon15,
                color: (() {
                  if (status == 'on progress'.toUpperCase()) {
                    return AppColors.primaryColor.withOpacity(0.6);
                  } else if(status == 'confirmed'.toUpperCase()) {
                    return AppColors.positiveColor;
                  } else {
                    AppColors.negativeColor;
                  }
                }()),
              )
            ],
          ),
          SizedBox(height: Dimensions.height20,),
          Row(
            children: [
              Icon(Icons.work, color: iconColor),
              SizedBox(
                width: Dimensions.width10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: 'Services: $services',
                      color: textColor,
                      textAlign: TextAlign.start,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: Dimensions.height10 / 2,
                    ),
                    SmallText(
                      text: 'Description: $description',
                      color: textColor,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      textOverflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width10,),
              Expanded(
                child: CustomButton2(
                  text: 'View',
                  onTap: onTap,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
