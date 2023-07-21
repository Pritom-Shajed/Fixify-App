import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';

class CustomDropDownFormField extends StatelessWidget {
  final List<DropdownMenuItem<Object>>? items;
  final String hintText;
  final String? titleText;
  final bool required;
  final bool turnOffTitleText;
  final Color? fillColor;
  final FontWeight? fontWeight;
  final Function(dynamic)? onChanged;
  final String? value;

  const CustomDropDownFormField({
    super.key,
    required this.items,
    required this.hintText,
    this.titleText,
    this.turnOffTitleText = false,
    this.required = true,
    this.onChanged,
    this.fillColor,
    this.fontWeight,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        turnOffTitleText
            ? Container()
            : TextWithStar(
                fontSize: Dimensions.font12,
                text: titleText ?? 'title',
                starEnable: required,
              ),
        turnOffTitleText
            ? Container()
            : SizedBox(
                height: Dimensions.height10,
              ),
        DropdownButtonFormField(
          isDense: true,
          padding: EdgeInsets.zero,
          onChanged: onChanged,
          value: value,
          items: items,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: Dimensions.font12,
                color: AppColors.blackColor,
                fontWeight: fontWeight),
            filled: true,
            fillColor: fillColor ?? AppColors.textFieldColor,
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
        turnOffTitleText
            ? Container()
            : SizedBox(
                height: Dimensions.height10,
              ),
      ],
    );
  }
}
