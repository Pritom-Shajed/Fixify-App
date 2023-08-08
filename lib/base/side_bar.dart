import 'package:fixify_app/base/show_custom_alert_dialog_with_btn.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Dimensions.height20 * 3,
                  ),
                  SizedBox(
                    width: Dimensions.width150,
                    child: Image.asset('assets/icons/fixify_logo.png'),
                  ),
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  const SmallText(text: 'Simplifying Technician Solution'),
                  Divider(
                    color: AppColors.greyColor,
                    height: Dimensions.height20 * 2,
                  ),

                  ///FOOTER
                  Get.find<AuthSignOutController>().userLoggedIn()
                      ? CustomButton2(
                          icon: Icons.logout,
                          text: 'Signout',
                          onTap: () => showCustomAlertDialogWithBtn(context,
                              titleText: 'Sign out?',
                              onTapYes: () {
                                Get.find<AuthSignOutController>()
                                    .clearSharedData();
                                Get.offAllNamed(RouteHelper.getSplashScreen());
                              },
                              onTapNo: () => Get.back()),
                        )
                      : CustomButton2(
                          text: 'Sign In',
                          icon: Icons.login,
                          onTap: () => Get.toNamed(RouteHelper.getAuthPage())),

                  SizedBox(height: Dimensions.height10,),

                  Get.find<AuthSignOutController>().userLoggedIn()
                      ? CustomButton2(
                          icon: Icons.work,
                          text: 'Hirings',
                          onTap: () => Get.toNamed(RouteHelper.getHiringsPage()),
                        )
                      : const SizedBox()
                  // Column(
                  //   children: [
                  //     SizedBox(
                  //         width: Dimensions.width10 * 10,
                  //         child: CustomButton(
                  //           text: 'Signout',
                  //           onTap: () => SignOutController.signOut(context),
                  //         )),
                  //     SizedBox(
                  //       height: Dimensions.height15 * 2.5,
                  //     ),
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
