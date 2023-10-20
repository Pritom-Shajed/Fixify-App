import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/hirings/price_update_button.dart';
import 'package:fixify_app/widgets/hirings/status_text.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field2.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/text_with_underline.dart';
import 'package:flutter/material.dart';

import '../technician/technician_info_text.dart';

class HiringInfoCardCustomer extends StatelessWidget {
  final String workingArea;
  final String status;
  final String lastUpdated;
  final String price;
  final String fullName;
  final String services;
  final String jobDescription;
  final String availability;
  final TextEditingController hiringPriceController;
  final VoidCallback onTapPriceUpdate;

  const HiringInfoCardCustomer(
      {Key? key,
      required this.workingArea,
      required this.status,
      required this.lastUpdated,
      required this.price,
      required this.fullName,
      required this.services,
      required this.jobDescription,
      required this.availability,
      required this.hiringPriceController,
      required this.onTapPriceUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HiringStatusText(status: status),
        SizedBox(
          height: Dimensions.height20,
        ),
        TextWithUnderline(
          text: 'Hiring Information',
          fontSize: Dimensions.font14,
        ),
        SizedBox(height: Dimensions.height10 * 3),
        TechnicianInfoText(
          text1: 'Current Price',
          text2: '$price ৳',
          fontSize: Dimensions.font14,
        ),
        TechnicianInfoText(
          text1: 'Last Updated By',
          text2: lastUpdated,
          fontSize: Dimensions.font14,
        ),
        TechnicianInfoText(
          text1: 'Services Covered',
          text2: services,
          fontSize: Dimensions.font14,
        ),
        TechnicianInfoText(
          text1: 'Job Description',
          text2: jobDescription,
          maxLines: 100,
          fontSize: Dimensions.font14,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        TextWithUnderline(
          text: 'Technician\'s Information',
          fontSize: Dimensions.font14,
        ),
        SizedBox(height: Dimensions.height10 * 3),
        TechnicianInfoText(
          text1: 'Name',
          text2: fullName,
          fontSize: Dimensions.font14,
        ),
        TechnicianInfoText(
          text1: 'Working Area',
          text2: workingArea,
          fontSize: Dimensions.font14,
        ),
        TechnicianInfoText(
          text1: 'Availability',
          text2: availability,
          fontSize: Dimensions.font14,
        ),
        (() {
          if (status == 'on progress'.toUpperCase()) {
            return Center(
              child: SizedBox(
                width: Dimensions.screenWidth / 2,
                child: Column(
                  children: [
                    PriceUpdateButton(
                        isEnabled: hiringPriceController.text == '0' || lastUpdated == 'customer' ? false : true,
                        title: 'Price',
                        hiringPriceController: hiringPriceController),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    CustomButton2(
                        text: 'Update Price', onTap: onTapPriceUpdate)
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        }()),
      ],
    );
  }
}
