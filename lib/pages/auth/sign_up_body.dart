import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passController;

  const SignUpBody(
      {Key? key,
      required this.nameController,
      required this.emailController,
      required this.passController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 3, color: AppColors.primaryColor)),
                ),
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.black, fontSize: Dimensions.font30),
                )),
          ),

          CustomTextFormField(
            hintText: 'Username',
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field can\'t be empty';
              }
            },
          ),
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
        ],
      ),
    );
  }
}
