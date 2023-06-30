import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/large_text.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogWithBtn extends StatelessWidget {
  final String titleText;
  final String? subtitleText;
  final String button1Text;
  final String button2Text;
  final Color? titleTextColor;
  final VoidCallback onTapYes;
  final VoidCallback onTapNo;
  final bool isNoButtonEnabled;

  const CustomAlertDialogWithBtn(
      {super.key,
      this.button1Text = 'Yes',
      this.button2Text = 'No',
      required this.titleText,
      this.titleTextColor,
       this.subtitleText,
      required this.onTapYes,
      this.isNoButtonEnabled = true,
      required this.onTapNo});

  @override
  Widget build(BuildContext context) {
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
                  text: subtitleText!,
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
  }
}
