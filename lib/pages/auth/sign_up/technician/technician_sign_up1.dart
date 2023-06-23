import 'dart:io';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/text_fields/custom_dropdown_form_field.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/dimensions.dart';

class TechnicianSignUpPage1 extends StatefulWidget {
  final VoidCallback onTapBack;
  final VoidCallback onTapProceed;

  const TechnicianSignUpPage1({Key? key, required this.onTapBack, required this.onTapProceed})
      : super(key: key);

  @override
  State<TechnicianSignUpPage1> createState() => _TechnicianSignUpPage1State();
}

class _TechnicianSignUpPage1State extends State<TechnicianSignUpPage1> {
  late TextEditingController signUpFullNameController;
  late TextEditingController nidCardNumber;
  late GlobalKey<FormState> formKeyTechnician;
  final List<String> _servicesOffered = ['Fridge', 'AC', 'Fan'];
  File? _image;
  late PageController _controller;
  int pageIndex = 0;

  Future getProfileImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);

    _image = imageTemporary;
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    signUpFullNameController = TextEditingController();
    nidCardNumber = TextEditingController();
    formKeyTechnician = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Upload Profile Picture
        ExpandablePageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (int value) {
              pageIndex = value;
              setState(() {});
            },
            children: [
              Column(
                children: [
                  Container(
                    height: Dimensions.profileImageSize,
                    width: Dimensions.profileImageSize,
                    decoration: BoxDecoration(
                        color: AppColors.greyColorLight,
                        borderRadius: BorderRadius.circular(4),
                        image: _image != null
                            ? DecorationImage(
                                image: FileImage(_image!), fit: BoxFit.cover)
                            : null,
                        border: Border.all(
                            width: 1, color: AppColors.primaryColorLight)),
                    child: _image == null
                        ? GestureDetector(
                            onTap: () => getProfileImage(),
                            child: Icon(
                              Icons.file_upload_outlined,
                              color: AppColors.primaryColorLight,
                            ))
                        : Container(),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  GestureDetector(
                    onTap: () => getProfileImage(),
                    child: SmallText(
                      text: _image == null
                          ? 'Add Profile Picture'
                          : 'Change Profile Picture',
                      color: _image == null
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ]),

        CustomTextFormField(
          titleText: 'Full Name',
          hintText: 'Full Name',
          controller: signUpFullNameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field can\'t be empty';
            }
          },
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        CustomDropDownFormField(
          items: _servicesOffered.map((value) {
            return DropdownMenuItem(
                value: value,
                child: SmallText(
                  text: value,
                ));
          }).toList(),
          hintText: 'Select service',
          titleText: 'Services Offered',
          validator: (value) {
            if (value == null) {
              return 'This field can\'t be empty';
            }
          },
        ),
        CustomTextFormField(
          titleText: 'NID Card',
          hintText: 'NID Card number',
          controller: nidCardNumber,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field can\'t be empty';
            }
          },
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              text: 'Proceed',
              onTap: widget.onTapProceed,
            ),
            CustomIconButton(icon: Icons.arrow_back, onTap: widget.onTapBack),
          ],
        )
      ],
    );
  }
}
