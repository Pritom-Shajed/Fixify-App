import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/large_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class TechnicianInfoShortCard extends StatelessWidget {
  final String largeText;
  final String smallText;
  final VoidCallback? onTap;

  const TechnicianInfoShortCard(
      {Key? key,
      required this.largeText,
      required this.smallText,
       this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(Dimensions.margin10),
        padding: EdgeInsets.all(Dimensions.padding10 * 2),
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
            LargeText(
              text: largeText,
              color: AppColors.blackColor,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SmallText(
              text: smallText,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
