import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/auth/auth_clip.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  final Widget signInBody;
  final Widget signUpBody;
  final CrossFadeState crossFadeState;
  final Widget signInButton;
  final Widget signUpButton;

  const AuthBody(
      {Key? key,
      required this.signInBody,
      required this.signUpBody,
      required this.crossFadeState,
      required this.signInButton,
      required this.signUpButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: ClipPath(
          clipper: AuthClip(),
          child: SizedBox(
            height: 470,
            child: Stack(
              children: [
                Container(
                  height: 450,
                  width: 300,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20 * 6,
                        left: Dimensions.height20,
                        right: Dimensions.height20,
                        bottom: Dimensions.height20),
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
        ),
        secondChild: ClipPath(
          clipper: AuthClip(flipped: true),
          child: SizedBox(
            height: 470,
            child: Stack(
              children: [
                Container(
                  height: 450,
                  width: 300,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20 * 6,
                        left: Dimensions.height20,
                        right: Dimensions.height20,
                        bottom: Dimensions.height20),
                    child: signUpBody,
                  ),
                ),
                 Positioned(
                    bottom: 0,
                    left: 90,
                    child: signUpButton),
              ],
            ),
          ),
        ),
        crossFadeState: crossFadeState,
        duration: const Duration(milliseconds: 300));
  }
}
