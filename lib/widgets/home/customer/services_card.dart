import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServicesCard({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.margin10),
      padding: EdgeInsets.all(Dimensions.padding10 * 3),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius4 * 3),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 5),
                color: AppColors.shadowColor),
          ]),
      child: Column(
        children: [
          CircleAvatar(
            radius: Dimensions.radius20 * 1.5,
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            child: Icon(
              icon,
              size: Dimensions.icon20 * 1.5,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          SmallText(
            text: title,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
