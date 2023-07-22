import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/base/show_fixify_footer.dart';
import 'package:fixify_app/controller/customer/customer_dashboard_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/customer/services_card.dart';
import 'package:fixify_app/widgets/home/customer/technician_info_header_customer.dart';
import 'package:fixify_app/widgets/home/customer/technician_info_short_card.dart';
import 'package:fixify_app/widgets/home/technician/technician_info_text.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/large_text.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class TechnicianInfoPageCustomer extends StatelessWidget {
  final String uid;

  const TechnicianInfoPageCustomer({Key? key, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Get.find<CustomerDashboardController>()
        .technicianInfo
        .where((element) => element.uid == uid)
        .single;
    return Scaffold(
        appBar: AppBar(
          leading:
              CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
          backgroundColor: AppColors.whiteColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TechnicianInfoHeaderCustomer(
                onTapHire: () {},
                fullName: userData.fullName!,
                nickName: userData.nickName!,
                division: userData.division!,
                area: userData.preferredArea!,
                profilePicUrl: userData.profilePic!),
            SizedBox(
              height: Dimensions.height10,
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TechnicianInfoShortCard(
                          largeText: userData.worksDone.toString(),
                          smallText: 'Works Done',
                        ),
                      ),
                      const Expanded(
                        child: TechnicianInfoShortCard(
                          largeText: '0',
                          smallText: 'Current Works',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.padding10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TechnicianProfilePreviewCard(children: [
                          ///Services
                           MediumText(
                            text: 'Services',
                            fontSize: Dimensions.font14,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: Dimensions.margin10),
                            height: Dimensions.height20 * 2,
                            alignment: Alignment.topLeft,
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: userData.services!.length,
                                itemBuilder: (context, index) {
                                  final service = userData.services![index];
                                  return Container(
                                    alignment: Alignment.center,
                                    width: Dimensions.width150 / 1.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius4),
                                      color: AppColors.mainBgColor,
                                    ),
                                    child: SmallText(
                                      text: service,
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(height: Dimensions.height10,),

                          TechnicianInfoText(
                            text1: 'Nickname',
                            text2: userData.nickName!,
                            fontSize: Dimensions.font14,
                          ),
                          TechnicianInfoText(
                            text1: 'Email',
                            text2: userData.email!,
                            fontSize: Dimensions.font14,
                          ),
                          TechnicianInfoText(
                            text1: 'Preferred Area',
                            text2:
                                "${userData.preferredArea!}, ${userData.division}",
                            fontSize: Dimensions.font14,
                          ),
                          TechnicianInfoText(
                            text1: 'NID Number',
                            text2: userData.nidNumber!,
                            fontSize: Dimensions.font14,
                          ),
                          TechnicianInfoText(
                            text1: 'Work Days',
                            text2: userData.workDays!.join(', '),
                            fontSize: Dimensions.font14,
                          ),
                          TechnicianInfoText(
                              text1: 'Work Time',
                              text2: '${userData.time1} to ${userData.time2}',
                              fontSize: Dimensions.font14,
                              borderSide: BorderSide.none),

                          ///Footer
                          showFixifyFooter(),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
