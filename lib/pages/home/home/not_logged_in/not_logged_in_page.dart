import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotLoggedInPage extends StatelessWidget {
  const NotLoggedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Dimensions.width150,
              child: Image.asset('assets/icons/fixify_logo.png'),
            ),
            const MediumText(
              text: 'Oops! Not logged in?',
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SmallText(
              text:
                  'You need to be a registered user to view your account. Please Sign In',
              color: AppColors.greyColor,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SizedBox(
              width: Dimensions.screenWidth / 2,
              child: CustomButton2(
                  text: 'Sign In', icon: Icons.login, onTap: () => Get.toNamed(RouteHelper.getAuthPage())),
            ),
          ],
        ),
      ),
    );
  }
}
