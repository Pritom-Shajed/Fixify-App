import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/pages/auth/auth_body.dart';
import 'package:fixify_app/widgets/auth/auth_button.dart';
import 'package:fixify_app/widgets/auth/auth_clip.dart';
import 'package:fixify_app/pages/auth/sign_in_body.dart';
import 'package:fixify_app/pages/auth/sign_up_body.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/foundation.dart';
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
                clipper: DiagonalPathClipperTwo(),
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.height20 * 4.2,
                  color: AppColors.primaryColor.withOpacity(0.5),
                )),
            ClipPath(
                clipper: DiagonalPathClipperOne(),
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.height20 * 4,
                  color: AppColors.primaryColor.withOpacity(0.5),
                )),

            //BODY
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: Dimensions.authLogoSize,
                            child: Image.asset('assets/icons/fixify_logo.png'),
                          ),
                          const Text('Simplifying Technician Selection'),
                        ],
                      ),
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
                        height: Dimensions.height20,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _signIn = !_signIn;
                            });
                          },
                          child: MediumText(
                            text: _signIn ? 'Sign Up' : 'Log In',
                            color: AppColors.primaryColor,
                          )),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'By signing up, you agree with our ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.font12),
                              children: [
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: Dimensions.font12),
                            )
                          ]))
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
