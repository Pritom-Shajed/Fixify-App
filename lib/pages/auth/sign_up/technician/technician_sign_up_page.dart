import 'dart:io';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/pages/auth/sign_up/technician/technician_sign_up1.dart';
import 'package:fixify_app/pages/auth/sign_up/technician/technician_sign_up2.dart';
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

class TechnicianSignUpPage extends StatefulWidget {
  final VoidCallback onTapBack;

  const TechnicianSignUpPage({Key? key, required this.onTapBack})
      : super(key: key);

  @override
  State<TechnicianSignUpPage> createState() => _TechnicianSignUpPageState();
}

class _TechnicianSignUpPageState extends State<TechnicianSignUpPage> {
  late TextEditingController signUpFullNameController;
  late GlobalKey<FormState> formKeyTechnician;
  late PageController _controller;
  int pageIndex = 0;


  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    formKeyTechnician = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyTechnician,
      child: Column(
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
                TechnicianSignUpPage1(onTapProceed: (){
                  if(formKeyTechnician.currentState!.validate()){
                    _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                  }
                },onTapBack: widget.onTapBack),
                TechnicianSignUpPage2(onTapProceed: (){
                  if(formKeyTechnician.currentState!.validate()){
                  }
                }, onTapBack: (){
                  _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                }),
              ]),
        ],
      ),
    );
  }
}
