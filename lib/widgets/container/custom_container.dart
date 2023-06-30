import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String titleText;
  const CustomContainer({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.padding5),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding10,
          vertical: Dimensions.padding5),
      decoration: BoxDecoration(
        color: AppColors.primaryColorLight.withOpacity(0.1),
        borderRadius:
        BorderRadius.circular(Dimensions.radius4),
      ),
      child: SmallText(
        text: titleText,
        color: AppColors.primaryColor,
        fontSize: Dimensions.font16,
      ),
    );
  }
}
