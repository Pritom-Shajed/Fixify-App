import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/base/show_custom_toast.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/customer/hiring_info_card_customer.dart';
import 'package:fixify_app/widgets/home/technician/hiring_info_card_technician.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
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
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainBgColor.withOpacity(0.3),
          leading:
              CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        ),
        body: GetBuilder<TechnicianHiringController>(
          builder: (hiringController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Dimensions.screenHeight / 4,
                  width: double.maxFinite,
                  color: AppColors.mainBgColor.withOpacity(0.3),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                                imageUrl: customerInfo!.profilePic!,
                                imageBuilder: (context, imageProvider) => Container(
                                  height: Dimensions.height20 * 5,
                                  width: Dimensions.height20 * 5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius4 * 3),
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover)),
                                ),
                                placeholder: (context, url) => ShimmerWidgetContainer(
                                    height: Dimensions.height20 * 5,
                                    width: Dimensions.height20 * 5)),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Expanded(
                              child: MediumText(
                                  textAlign: TextAlign.start,
                                  fontSize: Dimensions.font22,
                                  text: customerInfo.fullName ?? 'null'),
                            ),
                          ],
                        ),
                        ((){
                          if(jobDetail.status == 'on progress'){
                            if(jobDetail.lastUpdated == 'customer'){
                              return Row(
                                children: [
                                  Expanded(child: CustomButton2(
                                      text: 'Accept Offer', onTap: () {
                                    hiringController
                                        .acceptOrRejectOffer(
                                        technicianUid: jobDetail.technicianUid ?? 'null',
                                        customerUid: jobDetail.customerUid ?? 'null',
                                        jobId: jobId, isAccepted: true)
                                        .whenComplete(() =>
                                        Get.toNamed(RouteHelper.getHomeTechnician()));
                                  })),
                                  SizedBox(width: Dimensions.width10,),
                                  Expanded(child: CustomButton2(
                                      text: 'Reject Offer', onTap: () {
                                    hiringController.acceptOrRejectOffer(
                                        technicianUid: jobDetail.technicianUid ?? 'null',
                                        customerUid: jobDetail.customerUid ?? 'null',
                                        jobId: jobId, isAccepted: false)
                                        .whenComplete(() =>
                                        Get.toNamed(RouteHelper.getHomeTechnician()));
                                  })),
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          } else {
                            return const SizedBox();
                          }
                        }()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                        padding: EdgeInsets.all(Dimensions.padding15 * 1.5),
                        child: HiringInfoCardTechnician(
                          hiringPriceController:
                              hiringController.hiringPriceController,
                          status: jobDetail.status?.toUpperCase() ?? 'null',
                          lastUpdated: jobDetail.lastUpdated ?? 'customer',
                          price: jobDetail.price ?? '0',
                          fullName: customerInfo.fullName ?? 'null',
                          services: jobDetail.serviceName?.join(', ') ?? 'null',
                          jobDescription: jobDetail.jobDescription ?? 'null',
                          onTapPriceUpdate: () {
                            if(jobDetail.lastUpdated == 'technician'){
                              showCustomToast(
                                  'Wait for customer\'s response');
                            } else {
                              hiringController.updateHiringPrice(
                                  technicianUid: jobDetail.technicianUid ?? 'null',
                                  customerUid: jobDetail.customerUid ?? 'null',
                                  jobId: jobId,
                                  isCustomer: false)
                                  .whenComplete(() => Get.offNamedUntil(RouteHelper.getHomeTechnician(), (route) => route.isFirst));
                            }

                          },
                        )),
                  ),
                )
              ],
            );
          },
        ));
  }
}
