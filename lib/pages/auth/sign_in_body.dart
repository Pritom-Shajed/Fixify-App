import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passController;
  const SignInBody({Key? key, required this.emailController, required this.passController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 3,
                      color: AppColors.primaryColor)),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                  color: Colors.black, fontSize: 30),
            )),
        CustomTextFormField(
          hintText: 'Email Address',
          controller: emailController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field can\'t be empty';
            }
          },
        ),
        CustomTextFormField(
          hintText: 'Password',
          controller: passController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field can\'t be empty';
            }
          },
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MediumText(
              text: 'Forgot Password?',
              color: AppColors.primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
