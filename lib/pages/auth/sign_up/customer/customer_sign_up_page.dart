import 'package:fixify_app/controller/auth/auth_controller.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyCustomer,
      child: Column(
        children: [
          CustomTextFormField(
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
              controller: signUpPassController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field can\'t be empty';
                }
              },
            ),
          ),
          CustomTextFormField(
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
          )
        ],
      ),
    );
  }
}
