import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotLoggedInPage extends StatelessWidget {
  const NotLoggedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Dimensions.width150,
            child: Image.asset('assets/icons/fixify_logo.png'),
          ),
          CustomButton(
              text: 'Sign In',
              onTap: () => Get.toNamed(RouteHelper.getAuthPage()))
        ],
      ),
    );
  }
}
