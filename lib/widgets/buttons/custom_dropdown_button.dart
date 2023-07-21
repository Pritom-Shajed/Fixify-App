import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onChangedValue;
  final List<dynamic> options;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final Color? borderColor;
  final Color? bgColor;
  final Color? dropdownColor;
  final Color? iconColor;

  const CustomDropdownButton(
      {super.key,
        required this.onChangedValue,
        required this.selectedValue,
        required this.options,
        this.borderColor,
        this.padding,
        this.bgColor,
        this.dropdownColor,
        this.iconColor,
        this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius4),
        border: Border.all(color: borderColor ?? AppColors.blackColor, width: 0.5),
        color: bgColor ?? AppColors.blackColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: padding ?? EdgeInsets.all(Dimensions.padding10 / 2),
          isDense: true,
          dropdownColor: dropdownColor ?? AppColors.blackColor,
          iconEnabledColor: iconColor ?? AppColors.whiteColor,
          value: selectedValue,
          iconSize: Dimensions.buttonIconSize,
          onChanged: onChangedValue,
          items: options.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SmallText(
                text: value,
                color: textColor ?? AppColors.whiteColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}