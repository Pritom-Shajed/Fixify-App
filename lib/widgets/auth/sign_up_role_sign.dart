import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class SignUpRoleSign extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  const SignUpRoleSign({Key? key, required this.text, required this.icon, this.color,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SmallText(text: text, color: color ?? AppColors.primaryColor,),
        Icon(icon, color: color ?? AppColors.primaryColor, size: Dimensions.height20*1.2,),
      ],
    );
  }
}
