import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';

class CustomDropDownFormField extends StatelessWidget {
  final List<DropdownMenuItem<Object>>? items;
  final String hintText;
  final String titleText;
  final bool required;
    final Function(dynamic)? onChanged;

  const CustomDropDownFormField({
    super.key,
    required this.items,
    required this.hintText,
    required this.titleText,
    this.required = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWithStar(
          fontSize: Dimensions.font12,
              text: titleText,
              starEnable: required,
            ),
        SizedBox(
          height: Dimensions.height10,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          onChanged: onChanged,
          items: items,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: Dimensions.font12, color: AppColors.blackColor),
            filled: true,
            fillColor: AppColors.textFieldColor,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(Dimensions.radius4)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(Dimensions.radius4)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.redColor),
                borderRadius: BorderRadius.circular(Dimensions.radius4)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.redColor),
                borderRadius: BorderRadius.circular(Dimensions.radius4)),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
      ],
    );
  }
}
