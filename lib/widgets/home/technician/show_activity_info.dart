import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class ShowActiivtyInfo extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String iconPath;
  const ShowActiivtyInfo({Key? key, required this.onTap, required this.text, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius4 * 2),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                  color: AppColors.shadowColor),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: Dimensions.width150 / 3,
              child: Image.asset(iconPath),
            ),
            SizedBox(width: Dimensions.width10,),
            Expanded(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: MediumText(text: text))),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
