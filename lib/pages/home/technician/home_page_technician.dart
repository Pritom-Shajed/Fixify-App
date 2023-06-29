import 'package:fixify_app/base/show_custom_loading.dart';
import 'package:fixify_app/controller/signout/signout_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class HomePageTechnician extends StatefulWidget {
  const HomePageTechnician({Key? key}) : super(key: key);

  @override
  State<HomePageTechnician> createState() => _HomePageTechnicianState();
}

class _HomePageTechnicianState extends State<HomePageTechnician> {
  final technicianPageController = Get.find<TechnicianPageController>();

  @override
  void initState() {
    technicianPageController.fetchTechnicianUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<TechnicianPageController>(
      builder: (controller) {
        final userData = controller.userInfoTechnician;
        return userData == null
            ? showCustomLoading()
            : Stack(
                children: [
                  ClipPath(
                      clipper: DiagonalPathClipperTwo(),
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.screenHeight / 4.5,
                        color: AppColors.primaryColor,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.padding10*4,
                        left: Dimensions.padding10 * 2,
                    right: Dimensions.padding10 * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                MediumText(
                                  text: '${userData.fullName}',
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(
                                  height: Dimensions.height5,
                                ),
                                SmallText(
                                  text:
                                      'Technician | ${userData.services!.join(', ')}',
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(
                                  height: Dimensions.height5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: AppColors.whiteColor,
                                      size: 14,
                                    ),
                                    SmallText(
                                      text:
                                          '${userData.location}, ${userData.division}',
                                      color: AppColors.whiteColor,
                                    )
                                  ],
                                )
                              ],
                            ),
                            CustomButton(text: 'SignOut', onTap: () => SignOutController.signOut(context), color: AppColors.blackColor,)
                          ],
                        ),
                        SizedBox(height: Dimensions.height10,),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radius4 * 1.5),
                              color: AppColors.greyColor,
                              image: DecorationImage(
                                  image: NetworkImage(userData.profilePic!),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    ));
  }
}
