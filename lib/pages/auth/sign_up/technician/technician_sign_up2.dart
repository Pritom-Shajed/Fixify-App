import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TechnicianSignUpPage2 extends StatefulWidget {
  final VoidCallback onTapProceed;
  final VoidCallback onTapBack;
  const TechnicianSignUpPage2({Key? key, required this.onTapProceed, required this.onTapBack}) : super(key: key);

  @override
  State<TechnicianSignUpPage2> createState() => _TechnicianSignUpPage2State();
}

class _TechnicianSignUpPage2State extends State<TechnicianSignUpPage2> {
  late TextEditingController signUpFullNameController;
  @override
  void initState() {
    signUpFullNameController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: Dimensions.height10,
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
