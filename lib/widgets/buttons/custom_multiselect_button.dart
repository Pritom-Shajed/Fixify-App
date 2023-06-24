import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';

class CustomMultiSelectButton extends StatelessWidget {
  final String titleText;
  final bool required;
  final List<Object?> initialValue;
  final Widget multiSelectWidget;
  final String hintText;
  final List<Widget> children;

  const CustomMultiSelectButton({Key? key,
    required this.titleText,
    this.required = false,
    required this.initialValue,
    required this.multiSelectWidget,
    required this.children,
    required this.hintText,
  })
      : super(key: key);

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
        GestureDetector(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (ctx) {
                return multiSelectWidget;
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.padding10 * 2,
                horizontal: Dimensions.padding10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.textFieldColor,
              borderRadius: BorderRadius.circular(Dimensions.radius4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                initialValue.isEmpty
                    ? SmallText(
                  text: hintText,
                  color: AppColors.greyColor,
                ) : Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: children,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_circle,
                  size: Dimensions.icon20,
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
      ],
    );
  }
}
