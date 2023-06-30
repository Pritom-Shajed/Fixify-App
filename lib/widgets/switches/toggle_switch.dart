import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatefulWidget {
  final Function(bool)? onChanged;
  final bool current;
  final String firstText;
  final String secondText;

  const CustomToggleSwitch(
      {Key? key,
      required this.onChanged,
      this.current = false,
      required this.firstText,
      required this.secondText})
      : super(key: key);

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch.dual(
      borderRadius: BorderRadius.circular(Dimensions.radius4*2),
      current: widget.current,
      first: true,
      second: false,
      dif: Dimensions.width10 * 2,
      borderColor: Colors.transparent,
      borderWidth: 5.0,
      height: Dimensions.height10 * 3,
      onChanged: widget.onChanged,
      colorBuilder: (b) => b ? AppColors.primaryColor : AppColors.primaryColor,
      textBuilder: (value) => value
          ? Center(child: SmallText(text: widget.firstText))
          : Center(child: SmallText(text: widget.secondText)),
    );
  }
}
