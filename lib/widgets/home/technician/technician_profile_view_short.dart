import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/large_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class TechnicianProfileViewShort extends StatelessWidget {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String joinedDate;
  final String profilePicUrl;
  final VoidCallback onTapEditProfile;
  const TechnicianProfileViewShort({Key? key, required this.fullName, required this.email, required this.phoneNumber, required this.joinedDate, required this.profilePicUrl, required this.onTapEditProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(Dimensions.padding10),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius:
          BorderRadius.circular(Dimensions.radius4 * 3),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 5),
                color: AppColors.shadowColor),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LargeText(text: fullName, textAlign: TextAlign.start,),
                SizedBox(height: Dimensions.height20,),
                SmallText(text: 'Email', color: AppColors.greyColor,),
                SmallText(text: email, fontWeight: FontWeight.w600,),
                SizedBox(height: Dimensions.height10,),
                SmallText(text: 'Phone', color: AppColors.greyColor,),
                SmallText(text: phoneNumber, fontWeight: FontWeight.w600,),
                SizedBox(height: Dimensions.height10,),
                SmallText(text: 'Joined Date', color: AppColors.greyColor,),
                SmallText(text: joinedDate, fontWeight: FontWeight.w600,),
                SizedBox(height: Dimensions.height20,),
                CustomButton(text: 'Edit Profile', onTap: onTapEditProfile),
              ],
            ),
          ),
          Container(
            height: Dimensions.technicianHomeDpHeight,
            width: Dimensions.technicianHomeDpWidth,
            decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(
                    Dimensions.radius4 * 3),
                image: DecorationImage(
                    image:
                    NetworkImage(profilePicUrl),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
