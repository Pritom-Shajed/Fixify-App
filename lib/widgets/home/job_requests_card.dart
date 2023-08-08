import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class JobRequestCard extends StatelessWidget {
  final VoidCallback onTap;
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
      this.iconColor})
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
      child: Row(
        children: [
          Icon(Icons.work, color: iconColor),
          SizedBox(
            width: Dimensions.width10,
          ),
          Expanded(
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
          CustomButton(
            text: 'View',
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
