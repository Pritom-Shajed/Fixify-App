import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/widgets/auth/auth_button.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    signUpEmailController = TextEditingController();
    signUpPassController = TextEditingController();
    formKeyTechnician = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email Address',
            controller: signUpEmailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field can\'t be empty';
              }
            },
          ),
          CustomTextFormField(
            hintText: 'Password',
            controller: signUpPassController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field can\'t be empty';
              }
            },
          ),
          SizedBox(height: Dimensions.height20,),
          IconButton(
            onPressed: widget.onTapBack,
            icon: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                  size: 15,
                )),
          )
        ],
      ),
    );
  }
}
