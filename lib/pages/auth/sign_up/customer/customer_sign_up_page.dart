import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class CustomerSignUpPage extends StatefulWidget {
  final VoidCallback onTapBack;
  const CustomerSignUpPage({Key? key, required this.onTapBack}) : super(key: key);

  @override
  State<CustomerSignUpPage> createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  late TextEditingController signUpNameController;
  late TextEditingController signUpEmailController;
  late TextEditingController signUpPassController;
  late GlobalKey<FormState> fromKeyCustomer;

  @override
  void initState() {
    signUpNameController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPassController = TextEditingController();
    fromKeyCustomer = GlobalKey<FormState>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Username',
            controller: signUpNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field can\'t be empty';
              }
            },
          ),
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
