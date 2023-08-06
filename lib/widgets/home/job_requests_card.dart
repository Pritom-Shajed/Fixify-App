import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class JobRequestCard extends StatelessWidget {
  final String services;
  final String description;
  const JobRequestCard({Key? key, required this.services, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          const Icon(Icons.work),
          SizedBox(width: Dimensions.width10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(text: 'Services: $services'),
                SizedBox(height: Dimensions.height10/2,),
                SmallText(text: 'Description: $description')
              ],
            ),
          ),
          CustomButton2(text: 'View', onTap: (){})
        ],
      ),
    );
  }
}
