import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double iconSize;
  final double radius;
  const CustomIconButton({Key? key, required this.icon, required this.onTap, this.iconSize = 0, this.radius=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: CircleAvatar(
          radius: radius == 0 ? Dimensions.iconButtonRadius: radius,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            icon,
            color: AppColors.whiteColor,
            size: iconSize == 0 ? Dimensions.icon15: iconSize,
          )),
    );
  }
}
