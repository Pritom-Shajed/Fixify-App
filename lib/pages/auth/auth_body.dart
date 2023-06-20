import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/auth/auth_clip.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  final Widget signInBody;
  final Widget signUpBody;
  final CrossFadeState crossFadeState;
  final Widget signInButton;

  const AuthBody(
      {Key? key,
      required this.signInBody,
      required this.signUpBody,
      required this.crossFadeState,
      required this.signInButton,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: SizedBox(
          height: Dimensions.authBodyHeight375,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(Dimensions.width10),
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                height: Dimensions.authBodyHeight350,
                width: Dimensions.screenWidth*0.75,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                    color: AppColors.shadowColor),
                  ]
                ),
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.height20,),
                  child: signInBody,
                ),
              ),
               Positioned(
                  bottom: 0,
                  left: 100,
                  child: signInButton),
            ],
          ),
        ),
        secondChild: Container(
          margin: EdgeInsets.all(Dimensions.width10),
          height: Dimensions.authBodyHeight390,
          width: Dimensions.authBodyWidth,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                    color: AppColors.shadowColor),
              ]
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height20,),
            child: signUpBody,
          ),
        ),
        crossFadeState: crossFadeState,
        duration: const Duration(milliseconds: 300));
  }
}
