import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/text_fields/custom_dropdown_form_field.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class EditProfileInfo1stPart extends StatelessWidget {
  final TextEditingController nickNameController;
  final TextEditingController fullNameController;

  final TextEditingController phoneController;
  final String currentDivision;
  final Function(dynamic)? onChangedDivision;
  final List divisionName = [
    'Dhaka',
    'Chattogram',
    'Barishal',
    'Khulna',
    'Mymensignh',
    'Rajshahi',
    'Sylhet',
    'Rangpur',
  ];

   EditProfileInfo1stPart(
      {Key? key,
      required this.fullNameController,
      required this.phoneController,
      required this.nickNameController,
      required this.currentDivision,
      required this.onChangedDivision})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.margin10),
      child: ProfilePreviewCard(children: [
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
          titleText: 'Phone',
          controller: phoneController,
        ),
        CustomDropDownFormField(
          required: false,
          hintText: currentDivision,
          titleText: 'Division',
          items: divisionName.map((division) {
            return DropdownMenuItem(
              value: division,
              child: SmallText(
                text: division,
              ),
            );
          }).toList(),
          onChanged: onChangedDivision,
        ),
      ]),
    );
  }
}
