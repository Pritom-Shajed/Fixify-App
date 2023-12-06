import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/model/factory_data/factory_data.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/text_fields/custom_dropdown_form_field.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomerHomeProfileViewShort extends StatelessWidget {
  final String profilePicUrl;
  final String fullName;
  final String greetingsText;
  final ValueChanged<dynamic> updateSelectedDivision;
  final String selectedDivision;

  const CustomerHomeProfileViewShort(
      {Key? key,
      required this.profilePicUrl,
      required this.fullName,
      required this.greetingsText,
      required this.updateSelectedDivision, required this.selectedDivision,})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(Dimensions.radius12),
        color: AppColors.mainBgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CachedNetworkImage(
              imageUrl: profilePicUrl,
              imageBuilder: (context, imageProvider) => Container(
                    height: Dimensions.height20 * 3,
                    width: Dimensions.height20 * 3,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius4 * 3),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
              placeholder: (context, url) => ShimmerWidgetContainer(
                  height: Dimensions.height20 * 3,
                  width: Dimensions.height20 * 3)),
          SizedBox(
            width: Dimensions.width10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: 'Hi $fullName!',
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.font14,
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                 SmallText(
                  text: greetingsText,
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: CustomDropDownFormField(
          //     required: false,
          //     hintText: 'Location',
          //     turnOffTitleText: true,
          //     value: selectedDivision,
          //     fontWeight: FontWeight.w600,
          //     fillColor: AppColors.primaryColorLight,
          //     items: FactoryData.divisions.map((division) {
          //       return DropdownMenuItem(
          //         value: division,
          //         child: SmallText(
          //           text: division,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       );
          //     }).toList(),
          //     onChanged: updateSelectedDivision,
          //   ),
          // ),
        ],
      ),
    );
  }
}
