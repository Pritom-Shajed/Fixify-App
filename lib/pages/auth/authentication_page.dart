import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/pages/auth/auth_body.dart';
import 'package:fixify_app/widgets/auth/auth_button.dart';
import 'package:fixify_app/widgets/auth/auth_clip.dart';
import 'package:fixify_app/pages/auth/sign_in_body.dart';
import 'package:fixify_app/pages/auth/sign_up_body.dart';
import 'package:fixify_app/widgets/auth/auth_footer.dart';
import 'package:fixify_app/widgets/switches/toggle_switch.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:fixify_app/widgets/texts/text_with_underline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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

  late TextEditingController signUpNameController;
  late TextEditingController signUpEmailController;
  late TextEditingController signUpPassController;
  late GlobalKey<FormState> formKeySignIn;
  late GlobalKey<FormState> formKeySignUp;

  @override
  void initState() {
    signUpNameController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPassController = TextEditingController();
    signInEmailController = TextEditingController();
    signInPassController = TextEditingController();
    formKeySignIn = GlobalKey<FormState>();
    formKeySignUp = GlobalKey<FormState>();
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
                  height: Dimensions.height20 * 20,
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
                      //SWITCH BETWEEN SIGN IN & SIGN UP
                      CustomToggleSwitch(
                          current: _signIn,
                          firstText: 'Sign up',
                          secondText: 'Login',
                          onChanged: (value) {
                            setState(() {
                              _signIn = !_signIn;
                            });
                          }),

                      //LOGO
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

                      //BODY
                      AuthBody(
                        crossFadeState: _signIn
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        signInBody: Form(
                          key: formKeySignIn,
                          child: SignInBody(
                            emailController: signInEmailController,
                            passController: signInPassController,
                          ),
                        ),
                        signUpBody: Form(
                          key: formKeySignUp,
                          child: SignUpBody(
                            nameController: signUpNameController,
                            emailController: signUpEmailController,
                            passController: signUpPassController,
                          ),
                        ),
                        signInButton: AuthButton(
                          buttonText: 'LOGIN',
                          onTap: () {
                            if (formKeySignIn.currentState!.validate()) {}
                          },
                        ),
                        signUpButton: AuthButton(
                          buttonText: 'SIGN UP',
                          onTap: () {
                            if (formKeySignUp.currentState!.validate()) {}
                          },
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20 * 2,
                      ),

                      //FOOTER
                      AuthFooter(
                        signIn: _signIn,
                        onTapSignIn: () {
                          setState(() {
                            _signIn = !_signIn;
                          });
                        },
                        onTapSignUp: () {
                          setState(() {
                            _signIn = !_signIn;
                          });
                        },
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
