import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final VoidCallback onTapFindService;

  const DashboardHeader({Key? key, required this.onTapFindService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.all(Dimensions.padding10),
      width: double.maxFinite,
      height: Dimensions.height15 * 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            Dimensions.radius4 * 2),
        color: AppColors.primaryColor
            .withOpacity(0.05),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const MediumText(
                  textAlign: TextAlign.left,
                  text:
                  'Get technician from your location',
                  fontWeight: FontWeight.w500,),
                SizedBox(
                  height: Dimensions.height10,
                ),
                CustomButton(
                    text: 'Find technician',
                    onTap: onTapFindService)
              ],
            ),
          ),
          SizedBox(
            width: Dimensions.width150 * 1.2,
            child: Image.asset(
                'assets/icons/fixify_logo.png'),
          ),
        ],
      ),
    );
  }
}
