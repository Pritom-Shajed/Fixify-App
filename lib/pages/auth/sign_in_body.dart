import 'package:fixify_app/controller/auth/auth_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInBody extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passController;

  const SignInBody({Key? key, required this.emailController, required this.passController}) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  late AuthController controller;

  @override
  void initState() {
    controller = Get.find<AuthController>();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.black, fontSize: Dimensions.font30),
              )),
          SizedBox(
            height: Dimensions.height10,
          ),
          CustomTextFormField(
            prefixIcon: Icon(Icons.email, size: Dimensions.icon20,),
            hintText: 'Email Address',
            controller: widget.emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field can\'t be empty';
              }
            },
          ),
          Obx(
                () => CustomTextFormField(
              suffixIcon: GestureDetector(
                onTap: () =>
                    controller.changeObscureText(!controller.obscureText),
                child: Icon(
                  controller.obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: Dimensions.icon20,
                ),
              ),
              prefixIcon: Icon(
                Icons.lock,
                size: Dimensions.icon20,
              ),
              obscureText: controller.obscureText,
              hintText: 'Password',
              controller: widget.passController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field can\'t be empty';
                }
              },
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MediumText(
                text: 'Forgot Password?',
                color: AppColors.primaryColor,
                fontSize: Dimensions.font14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
