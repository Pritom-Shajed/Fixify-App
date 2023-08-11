import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field2.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class PriceUpdateButton extends StatelessWidget {
  final bool? isEnabled;
  final String title;
  final TextEditingController hiringPriceController;

  const PriceUpdateButton(
      {Key? key,
      required this.title,
      required this.hiringPriceController,
      this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Dimensions.screenWidth / 2,
        child: Container(
          padding: EdgeInsets.all(Dimensions.padding10),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius12)),
          child: Row(
            children: [
              MediumText(
                text: '$title :',
                color: AppColors.whiteColor,
              ),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              Expanded(
                  child: CustomTextField2(
                isEnabled: isEnabled ?? true,
                controller: hiringPriceController,
                textInputType: TextInputType.number,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
