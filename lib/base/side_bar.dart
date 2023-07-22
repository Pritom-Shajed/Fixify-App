import 'package:fixify_app/controller/customer/customer_controller.dart';
import 'package:fixify_app/controller/signout/signout_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
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
                  const SmallText(
                      text: 'Simplifying Technician Solution'),
                  Divider(
                    color: AppColors.greyColor,
                    height: Dimensions.height20 * 2,
                  ),

                  ///FOOTER
                  Column(
                    children: [
                      SizedBox(
                          width: Dimensions.width10 * 10,
                          child: CustomButton(
                            text: 'Signout',
                            onTap: () => SignOutController.signOut(context),
                          )),
                      SizedBox(
                        height: Dimensions.height15 * 2.5,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}