import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/widgets/container/custom_container.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomAlertDialog(
  BuildContext context, {
  required String titleText,
  Color? titleTextColor,
  required String bodyText,
  String? subtitleText,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          alignment: Alignment.center,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.radius12))),
          contentPadding: EdgeInsets.only(
              bottom: Dimensions.padding15 * 4,
              left: Dimensions.padding15,
              right: Dimensions.padding15),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.clear,
                    color: AppColors.primaryColor,
                  )),
            ],
          ),
          children: [
            Column(
              children: [
                MediumText(
                  text: titleText,
                  color: titleTextColor ?? AppColors.blackColor,
                  fontSize: Dimensions.font22,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                CustomContainer(titleText: bodyText),
                subtitleText == null
                    ? Container()
                    : SizedBox(
                        height: Dimensions.height10,
                      ),
                subtitleText == null
                    ? Container()
                    : Center(
                        child: MediumText(
                        textAlign: TextAlign.center,
                        text: subtitleText,
                        fontSize: Dimensions.font14,
                      )),
              ],
            ),
          ],
        );
      });
}
