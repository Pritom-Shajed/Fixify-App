import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/controller/customer/customer_dashboard_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubServicePage extends StatelessWidget {
  final String uid;

  const SubServicePage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Get.find<CustomerDashboardController>()
        .allServices
        .where((element) => element.uid == uid)
        .single;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading:
            CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        backgroundColor: AppColors.whiteColor,
      ),
      body: Column(
        children: [
          ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: Dimensions.height10,
                  ),
              shrinkWrap: true,
              itemCount: service.subService?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.padding10),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius4 * 2),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                            color: AppColors.shadowColor),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                          imageUrl: service.subService?[index].imageUrl ??
                              'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg',
                          imageBuilder: (context, imageProvider) => Container(
                                height: Dimensions.height20 * 5,
                                width: Dimensions.height20 * 5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.radius4),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                          placeholder: (context, url) => ShimmerWidgetContainer(
                              radius: Dimensions.radius4,
                              height: Dimensions.height20 * 5,
                              width: Dimensions.height20 * 5)),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MediumText(
                                textAlign: TextAlign.start,
                                text:
                                    service.subService?[index].title ?? 'null'),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            CustomButton(
                                text: 'View Details',
                                onTap: () => Get.toNamed(
                                    RouteHelper.getServiceDetailPage(
                                        index: index.toString(), uid: uid)))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
