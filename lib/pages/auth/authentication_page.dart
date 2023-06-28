import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/controller/auth/auth_signin_controller.dart';
import 'package:fixify_app/controller/auth/auth_signup_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/pages/auth/auth_body.dart';
import 'package:fixify_app/widgets/auth/auth_button.dart';
import 'package:fixify_app/pages/auth/sign_in/sign_in_body.dart';
import 'package:fixify_app/pages/auth/sign_up/sign_up_body.dart';
import 'package:fixify_app/pages/auth/auth_footer.dart';
import 'package:fixify_app/widgets/switches/toggle_switch.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _signIn = true;
  late TextEditingController signInEmailController;
  late TextEditingController signInPassController;
  final authSignInController = Get.find<AuthSignInController>();
  final authSignUpController = Get.find<AuthSignUpController>();

  @override
  void initState() {
    signInEmailController = TextEditingController();
    signInPassController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.mainBgColor,
        ),
        child: Stack(
          children: [
            //BG STYLE
            ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.screenHeight / 2,
                  color: AppColors.primaryColorLight,
                )),

            //BODY
            Padding(
              padding: EdgeInsets.only(top: Dimensions.height10 * 7),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///SWITCH BETWEEN SIGN IN & SIGN UP
                      CustomToggleSwitch(
                          current: _signIn,
                          firstText: 'Signup',
                          secondText: 'Login',
                          onChanged: (value) {
                            setState(() {
                              _signIn = !_signIn;
                            });
                          }),

                      ///LOGO
                      Column(
                        children: [
                          SizedBox(
                            width: Dimensions.authLogoSize,
                            child: Image.asset('assets/icons/fixify_logo.png'),
                          ),
                          const SmallText(
                              text: 'Simplifying Technician Selection')
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),

                      ///BODY
                      AuthBody(
                        crossFadeState: _signIn
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        signInBody: SignInBody(
                          emailController: signInEmailController,
                          passController: signInPassController,
                        ),
                        signUpBody: SignUpBody(
                          onTapProceedCustomer: () {
                            setState(() {
                              _signIn = !_signIn;
                            });
                          },
                          onTapProceedTechnician: () {
                            showCustomSnackBar('Sign in with your credential',
                                title: 'Account Registered');
                            setState(() {
                              _signIn = !_signIn;
                            });
                          },
                        ),
                        signInButton: AuthButton(
                          buttonText: 'LOGIN',
                          onTap: () {
                            if (signInEmailController.text.isEmpty ||
                                signInPassController.text.isEmpty) {
                              authSignInController.authSignInErrorOccured();
                              // showDefaultSnackBar(
                              //     'Please fill up all required fields',
                              //     context);
                            } else {
                              authSignInController.authSignInErrorCleared();
                              authSignInController.login(signInEmailController.text, signInPassController.text,);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: _signIn
                            ? Dimensions.height20 * 2
                            : Dimensions.height20,
                      ),

                      ///FOOTER
                      AuthFooter(
                        signIn: _signIn,
                        onTapSignIn: () {
                          authSignUpController.authSignUpErrorCleared();
                          setState(() {
                            _signIn = !_signIn;
                          });
                        },
                        onTapSignUp: () {
                          authSignInController.authSignInErrorCleared();
                          setState(() {
                            _signIn = !_signIn;
                          });
                        },
                        onTapForgotPass: () {},
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
