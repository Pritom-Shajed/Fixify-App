import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

 showCustomAlertDialogWithBtn (BuildContext context, {
  required String titleText,
   String? subtitleText,
   String button1Text = 'Yes',
   String button2Text = 'No',
   Color? titleTextColor,
   required VoidCallback onTapYes,
   required VoidCallback onTapNo,
   bool isNoButtonEnabled = true,
}){
  showDialog(context: context, builder: (context){
    return SimpleDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius12)),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: Dimensions.padding15 * 2,
        horizontal: Dimensions.padding15,
      ),
      children: [
        Column(
          children: [
            MediumText(
              text: titleText,
              color: titleTextColor ?? AppColors.blackColor,
              fontSize: Dimensions.font22,
            ),
            subtitleText == null ? Container(): SizedBox(
              height: Dimensions.height10,
            ),
            subtitleText == null ? Container(): Center(
                child: MediumText(
                  textAlign: TextAlign.center,
                  text: subtitleText,
                  fontSize: Dimensions.font14,
                )),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(Dimensions.padding15),
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                      textColor: AppColors.primaryColor,
                      color: AppColors.primaryColorLight.withOpacity(0.3),
                      onTap: onTapYes,
                      text: button1Text)),
              SizedBox(
                width: Dimensions.width10,
              ),
              isNoButtonEnabled
                  ? Expanded(
                  child: CustomButton(
                      textColor: AppColors.primaryColor,
                      color: AppColors.primaryColorLight.withOpacity(0.3),
                      onTap: onTapNo,
                      text: button2Text))
                  : Container(),
            ],
          ),
        )
      ],
    );
  });
}