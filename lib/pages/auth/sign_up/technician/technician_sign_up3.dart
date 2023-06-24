import 'package:fixify_app/model/days_model.dart';
import 'package:fixify_app/model/factory_data/factory_data.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/buttons/custom_multiselect_button.dart';
import 'package:fixify_app/widgets/container/custom_container.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class TechnicianSignUpPage2 extends StatefulWidget {
  final VoidCallback onTapProceed;
  final VoidCallback onTapBack;

  const TechnicianSignUpPage2(
      {Key? key, required this.onTapProceed, required this.onTapBack})
      : super(key: key);

  @override
  State<TechnicianSignUpPage2> createState() => _TechnicianSignUpPage2State();
}

class _TechnicianSignUpPage2State extends State<TechnicianSignUpPage2> {
  late TextEditingController signUpFullNameController;
  late TextEditingController nidCardNumber;


  @override
  void initState() {
    signUpFullNameController = TextEditingController();
    nidCardNumber = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///NID CARD
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
