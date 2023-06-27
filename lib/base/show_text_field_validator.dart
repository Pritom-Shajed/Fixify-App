import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

Widget showCustomAuthValidator (String message){
  return Container(
    padding: EdgeInsets.all(Dimensions.padding10),
    margin: EdgeInsets.symmetric(vertical: Dimensions.padding10),
    width: double.maxFinite,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.radius4),
      color: Colors.redAccent,
    ),
    child: SmallText(
      text: message,
      color: AppColors.whiteColor,
    ),
  );
}