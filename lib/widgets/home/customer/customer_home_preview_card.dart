import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomerHomeProfileViewShort extends StatelessWidget {
  final String profilePicUrl;
  final String fullName;
  const CustomerHomeProfileViewShort({Key? key, required this.profilePicUrl, required this.fullName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.margin10),
      padding: EdgeInsets.all(Dimensions.padding10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(Dimensions.radius12),
        color: AppColors.mainBgColor,
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.height20*3,
            height: Dimensions.height20*3,
            decoration: BoxDecoration(
                border:
                Border.all(color: AppColors.greyColorLight),
                borderRadius:
                BorderRadius.circular(Dimensions.radius4 * 2),
                color: AppColors.mainBgColor,
                image: DecorationImage(
                    image: NetworkImage(profilePicUrl),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: 'Hi $fullName!',
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.font14,
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                const SmallText(
                  text: 'Good Morning...',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
