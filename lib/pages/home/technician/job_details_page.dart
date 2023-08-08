import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDetailsPageTechnician extends StatelessWidget {
  final String jobId;

  const JobDetailsPageTechnician({Key? key, required this.jobId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobDetail = Get.find<TechnicianHiringController>()
        .allJobRequests
        .where((element) => element.id == jobId)
        .single;

    final customerInfo =
        Get.find<TechnicianHiringController>().userInfoCustomer;
    return Scaffold(
      backgroundColor: AppColors.mainBgColor,
      appBar: AppBar(
        leading:
            CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
          child: Column(
            children: [
              Container(
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
                        imageUrl: customerInfo!.profilePic!,
                        imageBuilder: (context, imageProvider) => Container(
                              height: Dimensions.height20 * 3,
                              width: Dimensions.height20 * 3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius4 * 3),
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
                            text: 'Ordered by ${customerInfo.fullName}',
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.font14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
