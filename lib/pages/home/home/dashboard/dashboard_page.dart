import 'package:fixify_app/base/side_bar.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/controller/home/customer_controller.dart';
import 'package:fixify_app/controller/home/dashboard_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/buttons/custom_text_button.dart';
import 'package:fixify_app/widgets/home/customer/customer_home_preview_card.dart';
import 'package:fixify_app/widgets/home/customer/dashboard_header.dart';
import 'package:fixify_app/widgets/home/customer/dashboard_technician_card.dart';
import 'package:fixify_app/widgets/home/customer/services_card.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  Future<void> _loadAllData() async {
    await Get.find<CustomerController>().fetchCustomerUserInfo();
    await Get.find<DashboardController>().fetchAllTechnician();
    await Get.find<DashboardController>().fetchAllServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        drawer: const SideBar(),
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: const Text('Home'),
          actions: [
            CustomIconButton(icon: Icons.notifications, onTap: () {}),
          ],
        ),
        body: GetBuilder<DashboardController>(
          builder: (dashboardController) {
            final technicianInfo = dashboardController.technicianInfo;
            return GetBuilder<CustomerController>(
                builder: (customerController) {
              final userData = customerController.userInfoCustomer;
              return Padding(
                padding: EdgeInsets.all(Dimensions.padding10 * 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Get.find<AuthSignOutController>().userLoggedIn()
                        ? CustomerHomeProfileViewShort(
                            profilePicUrl: userData?.profilePic ??
                                'https://www.kindpng.com/picc/m/207-2074624_white-gray-circle-avatar-png-transparent-png.png',
                            fullName: userData?.fullName ?? 'null',
                            selectedDivision:
                                dashboardController.selectedDivision,
                            updateSelectedDivision:
                                dashboardController.updateSelectedDivision,
                          )
                        : const SizedBox(),
                    const Divider(),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: _loadAllData,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: Dimensions.height10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DashboardHeader(onTapFindService: () {}),
                                SizedBox(
                                  height: Dimensions.height15,
                                ),
                                const SmallText(
                                  text: 'Book a service',
                                  fontWeight: FontWeight.w600,
                                ),

                                SizedBox(
                                  height: Dimensions.height20 * 9,
                                  child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: Dimensions.width10 / 2,
                                          ),
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: dashboardController
                                          .allServices.length,
                                      itemBuilder: (context, index) {
                                        final service = dashboardController
                                            .allServices[index];
                                        return ServicesCard(
                                            onTap: () {
                                              Get.toNamed(RouteHelper
                                                  .getSubServicesPage(
                                                      service.uid!));
                                            },
                                            title: service.name ?? ' null',
                                            iconPath: service.icon ?? 'null');
                                      }),
                                ),
                                SizedBox(
                                  height: Dimensions.height15,
                                ),

                                ///NEAR YOU
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SmallText(
                                        textAlign: TextAlign.start,
                                        text:
                                            'Technicians in ${dashboardController.selectedDivision}',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    CustomTextButton(
                                        text: 'See all', onTap: () {})
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: Dimensions.height10,
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: technicianInfo
                                        .where((element) =>
                                            element.division ==
                                            dashboardController
                                                .selectedDivision)
                                        .length,
                                    itemBuilder: (context, index) {
                                      final technician = technicianInfo
                                          .where((element) =>
                                              element.division ==
                                              dashboardController
                                                  .selectedDivision)
                                          .toList()[index];
                                      return DashboardTechnicianCard(
                                        onTap: () {
                                          Get.toNamed(RouteHelper
                                              .getTechnicianInfoPageCustomer(
                                                  technician.uid!));
                                        },
                                        name: technician.nickName ?? 'Null',
                                        imageUrl: technician.profilePic ??
                                            'https://i.pinimg.com/736x/bb/e3/02/bbe302ed8d905165577c638e908cec76.jpg',
                                        time:
                                            '${technician.time1} - ${technician.time2}',
                                        location: technician.division ?? 'null',
                                        services:
                                            technician.services?.join(', ') ??
                                                'null',
                                      );
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
          },
        ));
  }
}
