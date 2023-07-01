import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onTap;
  const CustomButton2({Key? key, required this.text, this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding10),
        decoration: BoxDecoration(
            color: AppColors.primaryColorLight.withOpacity(0.6),
            borderRadius: BorderRadius.circular(Dimensions.radius4*2)
        ),
        child: Row(children: [
          SmallText(text: text, color: AppColors.primaryColor,),
          SizedBox(width: icon == null ? 0 : Dimensions.width5,),
         icon == null ? Container(): Icon(
            icon,
            color: AppColors.primaryColor,
            size: Dimensions.icon15,
          ),
        ]),
      ),
    );
  }
}
