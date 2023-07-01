import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/home/technician/technician_dp_with_edit_btn.dart';
import 'package:fixify_app/widgets/shimmer_effect/circle_shimmer_widget.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/base/show_fixify_footer.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/home/technician/technician_info_text.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProfileTechnician extends StatelessWidget {
  const ViewProfileTechnician({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBgColor,
        appBar: AppBar(
          title: const Text('PROFILE'),
        ),
        body: GetBuilder<TechnicianPageController>(builder: (controller) {
          var userData = controller.userInfoTechnician!;
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.height10,
                horizontal: Dimensions.width10 * 2),
            child: Column(
              children: [
                ///Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                            imageUrl: userData.profilePic!,
                            imageBuilder: (context, imageProvider) =>
                                TechnicianDpWithEditBtn(
                                    imageProvider: imageProvider),
                            placeholder: (context, url) => ShimmerWidgetCircle(
                                  radius:
                                      Dimensions.technicianViewProfileDpRadius,
                                )),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MediumText(
                              text: userData.nickName!,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Dimensions.height5,
                            ),
                            SmallText(
                              text: 'Joined: ${userData.joinedDate}',
                            ),
                            SizedBox(
                              height: Dimensions.height5,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomButton2(
                      text: 'Edit Profile',
                      icon: Icons.edit,
                      onTap: () => Get.toNamed(
                          RouteHelper.getEditProfileTechnician()),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),

                ///BODY
                Expanded(
                  child: SingleChildScrollView(
                    child: TechnicianProfilePreviewCard(children: [
                      TechnicianInfoText(
                        text1: 'Role',
                        text2: 'Technician',
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                        text1: 'Full Name',
                        text2: userData.fullName!,
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                        text1: 'Email',
                        text2: userData.email!,
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                        text1: 'Phone',
                        text2: userData.phoneNumber!,
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                        text1: 'Preferred Area',
                        text2: "${userData.preferredArea!}, ${userData.division}",
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                        text1: 'Works Done',
                        text2: '${userData.worksDone!}',
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                        text1: 'Services Offered',
                        text2: userData.services!.join(', '),
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                        text1: 'NID Number',
                        text2: userData.nidNumber!,
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                        text1: 'Work Days',
                        text2: userData.workDays!.join(', '),
                        fontSize: Dimensions.font14,
                      ),
                      TechnicianInfoText(
                          text1: 'Work Time',
                          text2: '${userData.time1} to ${userData.time2}',
                          fontSize: Dimensions.font14,
                          borderSide: BorderSide.none),

                      ///Footer
                      showFixifyFooter(),
                    ]),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
