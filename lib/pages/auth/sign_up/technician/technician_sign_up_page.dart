import 'package:fixify_app/controller/auth/auth_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/widgets/auth/auth_button.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';

class TechnicianSignUpPage extends StatefulWidget {
  final VoidCallback onTapBack;

  const TechnicianSignUpPage({Key? key, required this.onTapBack})
      : super(key: key);

  @override
  State<TechnicianSignUpPage> createState() => _TechnicianSignUpPageState();
}

class _TechnicianSignUpPageState extends State<TechnicianSignUpPage> {
  late TextEditingController signUpEmailController;
  late TextEditingController signUpPassController;
  late GlobalKey<FormState> formKeyTechnician;
  late AuthController controller;

  @override
  void initState() {
    signUpEmailController = TextEditingController();
    signUpPassController = TextEditingController();
    formKeyTechnician = GlobalKey<FormState>();
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
      key: formKeyTechnician,
      child: Column(
        children: [
          CustomTextFormField(
            prefixIcon: Icon(Icons.email, size: Dimensions.icon20,),
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
          SizedBox(height: Dimensions.height20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(text: 'Proceed', onTap: (){
                if(formKeyTechnician.currentState!.validate()){}
              },),
              CustomIconButton(icon: Icons.arrow_back, onTap: widget.onTapBack),
            ],
          )
        ],
      ),
    );
  }
}
