import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatefulWidget {
  bool signIn;
  VoidCallback onTapSignIn;
  VoidCallback onTapSignUp;
  VoidCallback onTapForgotPass;

  AuthFooter(
      {Key? key,
      required this.signIn,
      required this.onTapSignIn,
      required this.onTapSignUp,
      required this.onTapForgotPass})
      : super(key: key);

  @override
  State<AuthFooter> createState() => _AuthFooterState();
}

class _AuthFooterState extends State<AuthFooter> {
  @override
  Widget build(BuildContext context) {
    return widget.signIn
        ? Column(
            children: [
              RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                          color: Colors.black, fontSize: Dimensions.font12),
                      children: [
                    TextSpan(
                      text: 'Signup',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.font14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onTapSignUp,
                    )
                  ])),
            ],
          )
        : Column(
            children: [
              RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                          color: Colors.black, fontSize: Dimensions.font12),
                      children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: Dimensions.font14),
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onTapSignIn)
                  ])),
              SizedBox(
                height: Dimensions.height20,
              ),
              RichText(
                  text: TextSpan(
                      text: 'By signing up, you agree with our ',
                      style: TextStyle(
                          color: Colors.black, fontSize: Dimensions.font12),
                      children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.font12),
                    )
                  ])),
            ],
          );
  }
}
