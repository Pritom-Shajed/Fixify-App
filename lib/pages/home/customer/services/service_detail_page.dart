import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/controller/customer/customer_dashboard_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailPage extends StatelessWidget {
  final String uid;
  final int index;

  const ServiceDetailPage({Key? key, required this.uid, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subService = Get.find<CustomerDashboardController>()
        .allServices
        .where((element) => element.uid == uid)
        .single
        .subService?[index];
    return Scaffold(
      appBar: AppBar(
        leading:
            CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        backgroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding10),
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                      imageUrl: subService?.imageUrl ??
                          'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg',
                      imageBuilder: (context, imageProvider) => Container(
                            height: Dimensions.height20 * 10,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius4),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                      placeholder: (context, url) => ShimmerWidgetContainer(
                          radius: Dimensions.radius4,
                          height: Dimensions.height20 * 10,
                          width: double.maxFinite)),
                  Positioned(
                      top: Dimensions.height10,
                      right: Dimensions.width10,
                      child: CustomButton(
                          text: 'View Available Technicians',
                          onTap: () {
                            Get.toNamed(
                                RouteHelper.getSpecificServiceAllTechnicianInfo(
                                    Get.find<CustomerDashboardController>()
                                        .allServices
                                        .where((element) => element.uid == uid)
                                        .single
                                        .name!));
                          }))
                ],
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              MediumText(
                text: subService?.title ?? 'null',
                fontWeight: FontWeight.w600,
              ),
              Divider(
                color: AppColors.mainBgColor,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: 'What\'s included?',
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.font14,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: Dimensions.height5 / 2,
                            ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: subService!.included!.length,
                        itemBuilder: (context, index) {
                          return SmallText(
                            textAlign: TextAlign.start,
                            text:
                                '${index + 1}. ${subService.included![index]}',
                            color: AppColors.blackColor,
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
