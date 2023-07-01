import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/large_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class TechnicianHomeProfileViewShort extends StatelessWidget {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String joinedDate;
  final String profilePicUrl;
  final VoidCallback onTapEditProfile;

  const TechnicianHomeProfileViewShort(
      {Key? key,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.joinedDate,
      required this.profilePicUrl,
      required this.onTapEditProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(Dimensions.padding10),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius4 * 3),
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
                const LargeText(
                  text: 'Technician',
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                SmallText(
                  text: 'Name',
                  color: AppColors.greyColor,
                ),
                SmallText(
                  text: fullName,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                SmallText(
                  text: 'Email',
                  color: AppColors.greyColor,
                ),
                SmallText(
                  text: email,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                SmallText(
                  text: 'Phone',
                  color: AppColors.greyColor,
                ),
                SmallText(
                  text: phoneNumber,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                CustomButton(text: 'View Profile', onTap: onTapEditProfile),
              ],
            ),
          ),
          CachedNetworkImage(
              imageUrl: profilePicUrl,
              imageBuilder: (context, imageProvider) => Container(
                    height: Dimensions.technicianHomeDpHeight,
                    width: Dimensions.technicianHomeDpWidth,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius4 * 3),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
              placeholder: (context, url) => ShimmerWidgetContainer(
                  height: Dimensions.technicianHomeDpHeight,
                  width: Dimensions.technicianHomeDpWidth)),
        ],
      ),
    );
  }
}
