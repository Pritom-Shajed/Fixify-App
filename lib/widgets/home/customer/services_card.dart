import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  final String title;
  final String iconPath;

  const ServicesCard({Key? key, required this.title, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.margin10),
      padding: EdgeInsets.all(Dimensions.padding10 * 2),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius4 * 3),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 5),
                color: AppColors.shadowColor),
          ]),
      child: Column(
        children: [
          CachedNetworkImage(
              imageUrl: iconPath,
              imageBuilder: (context, imageProvider) => Container(
                padding:  EdgeInsets.all(Dimensions.padding10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(Dimensions.radius4 * 3),
                ),

                child: Container(
                  height: Dimensions.height20 * 3,
                  width: Dimensions.height20 * 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
              placeholder: (context, url) => ShimmerWidgetContainer(
                  height: Dimensions.height20 * 4,
                  width: Dimensions.height20 * 4)),
          SizedBox(
            height: Dimensions.height10,
          ),
          SizedBox(
            width: Dimensions.width10*10,
            child: SmallText(
              text: title,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
