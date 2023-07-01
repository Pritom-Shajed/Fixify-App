import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfileInfo1stPart extends StatelessWidget {
  final String nidNumber;
  final TextEditingController nickNameController;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  const EditProfileInfo1stPart({Key? key, required this.nidNumber, required this.fullNameController, required this.emailController, required this.phoneController, required this.nickNameController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.margin10),
      child: TechnicianProfilePreviewCard(children: [
        CustomTextField(
          required: false,
          isEnabled: false,
          titleText: 'NID Number',
          hintText: nidNumber,
        ),
        CustomTextField(
          required: false,
          titleText: 'Full Name',
          controller: fullNameController,
        ),
        CustomTextField(
          required: false,
          titleText: 'Nick Name',
          controller: nickNameController,
        ),
        CustomTextField(
          required: false,
          titleText: 'Email',
          controller: emailController,
        ),
        CustomTextField(
          required: false,
          titleText: 'Phone',
          controller: phoneController,
        ),
      ]),
    );
  }
}
