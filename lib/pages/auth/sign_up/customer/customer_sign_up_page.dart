import 'package:fixify_app/controller/auth/auth_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/auth/sign_up_role_sign.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerSignUpPage extends StatefulWidget {
  final VoidCallback onTapBack;

  const CustomerSignUpPage({Key? key, required this.onTapBack})
      : super(key: key);

  @override
  State<CustomerSignUpPage> createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  late TextEditingController signUpNameController;
  late TextEditingController signUpEmailController;
  late TextEditingController signUpPassController;
  late TextEditingController signUpPhoneController;
  late GlobalKey<FormState> formKeyCustomer;

 late AuthController controller;

  @override
  void initState() {
    signUpNameController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPassController = TextEditingController();
    signUpPhoneController = TextEditingController();
    formKeyCustomer = GlobalKey<FormState>();
    controller = Get.find<AuthController>();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyCustomer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpRoleSign(text: 'Customer', icon: Icons.man),

          CustomTextFormField(
            titleText: 'Username',
            prefixIcon: Icon(
              Icons.person,
              size: Dimensions.icon20,
            ),
            hintText: 'Username',
            controller: signUpNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field can\'t be empty';
              }
            },
          ),
          CustomTextFormField(
            titleText: 'Email Address',
            textInputType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.email,
              size: Dimensions.icon20,
            ),
            hintText: 'Email Address',
            controller: signUpEmailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field can\'t be empty';
              }
            },
          ),
          Obx(
            () => CustomTextFormField(
              titleText: 'Password',
              suffixIcon: GestureDetector(
                onTap: () =>
                    controller.changeObscureTextCustomerSignUp(!controller.obscureTextCustomerSignUp),
                child: Icon(
                  controller.obscureTextCustomerSignUp
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: Dimensions.icon20,
                ),
              ),
              prefixIcon: Icon(
                Icons.lock,
                size: Dimensions.icon20,
              ),
              obscureText: controller.obscureTextCustomerSignUp,
              hintText: 'Password',
              controller: signUpPassController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field can\'t be empty';
                }
              },
            ),
          ),
          CustomTextFormField(
            titleText: 'Phone Number',
            textInputType: TextInputType.number,
            prefixIcon: Icon(
              Icons.phone,
              size: Dimensions.icon20,
            ),
            hintText: '01xxxxxxxxx',
            controller: signUpPhoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field can\'t be empty';
              }
            },
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: 'Sign Up',
                onTap: () {
                  if (formKeyCustomer.currentState!.validate()) {}
                },
              ),
              CustomIconButton(icon: Icons.arrow_back, onTap: widget.onTapBack),
            ],
          ),
        ],
      ),
    );
  }
}
