import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class RoleButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? bgColor;
  final Color? textIconColor;
  final VoidCallback onTap;
  const RoleButton({Key? key, required this.text, required this.icon, this.bgColor, required this.onTap, this.textIconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding10),
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius20/3),
            border: Border.all(
              color: AppColors.primaryColor,
            ),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 5,
                  offset: const Offset(3, 3)
              )
            ]
        ),
        child:  Column(
          children: [
            SmallText(text: text, color: textIconColor ?? AppColors.blackColor,),
            Icon(icon, color: textIconColor ?? AppColors.blackColor,),
          ],
        ),
      ),
    );
  }
}
