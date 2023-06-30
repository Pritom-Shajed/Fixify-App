import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerWidget({Key? key, required this.height, required this.width, this.baseColor, this.highlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.shimmerColor1,
      highlightColor: highlightColor ?? AppColors.shimmerColor2,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.shimmerColor1,
          borderRadius: BorderRadius.circular(Dimensions.radius4 * 3),
        ),
      ));
}
