import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget showCustomLoader({Color? color}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitSpinningLines(
          color: color ?? AppColors.blackColor,
          size: Dimensions.width10 * 5,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(text: 'Loading...', color: color ?? AppColors.blackColor,),
      ],
    ),
  );
}
