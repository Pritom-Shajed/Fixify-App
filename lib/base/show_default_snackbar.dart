import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

void showDefaultSnackBar(
  String message,
  BuildContext context, {
  bool isError = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isError ? Colors.redAccent: AppColors.primaryColor,
      duration: const Duration(seconds: 2),
      content: SmallText(
        text: message,
        color: AppColors.whiteColor,
      )));
}
