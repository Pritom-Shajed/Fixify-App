import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgetCircle extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  final double? radius;

  const ShimmerWidgetCircle({Key? key, this.baseColor, this.highlightColor, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.shimmerColor1,
      highlightColor: highlightColor ?? AppColors.shimmerColor2,
      child: CircleAvatar(
        radius: radius,
      ));
}
