import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fixify_app/base/side_bar.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/controller/home/customer_controller.dart';
import 'package:fixify_app/controller/home/dashboard_controller.dart';
import 'package:fixify_app/controller/home/home_page_controller.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/greetings/time_greetings.dart';
import 'package:fixify_app/widgets/home/customer/customer_home_preview_card.dart';
import 'package:fixify_app/widgets/home/customer/dashboard_header.dart';
import 'package:fixify_app/widgets/home/customer/services_card.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  Future<void> _loadAllData() async {
    Get.find<AuthSignOutController>().userLoggedIn()
        ? await Get.find<CustomerController>().fetchCustomerUserInfo()
        : null;
    Get.find<AuthSignOutController>().userLoggedIn()
        ? await Get.find<TechnicianHiringController>().fetchJobRequests()
        : null;
    await Get.find<DashboardController>().fetchAllTechnician();
    await Get.find<DashboardController>().fetchAllServices();
    await Get.find<DashboardController>().fetchAllBanners();
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
            CustomIconButton(
                icon: Icons.notifications,
                onTap: () => Get.toNamed(RouteHelper.getNotificationPage(
                    userId:
                        Get.find<CustomerController>().userInfoCustomer?.uid ??
                            'null'))),
          ],
        ),
        body: GetBuilder<DashboardController>(
          builder: (controller) {
            List<String?> bannerUrls = controller.allBanners.where((element) => element.bannerType == 'Dashboard Banner')
                .map((model) => model.bannerList?.map((banner) => banner.bannerUrl) ?? [])
                .expand((urls) => urls)
                .toList();
            return GetBuilder<CustomerController>(builder: (customerController) {
              final userData = customerController.userInfoCustomer;
              return RefreshIndicator(
                onRefresh: _loadAllData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Get.find<AuthSignOutController>().userLoggedIn()
                          ? Padding(
                        padding: EdgeInsets.only(top: Dimensions.padding10 * 1.2, left: Dimensions.padding10 * 1.2, right: Dimensions.padding10 * 1.2),
                            child: CustomerHomeProfileViewShort(
                                profilePicUrl: userData?.profilePic ??
                                    'https://www.kindpng.com/picc/m/207-2074624_white-gray-circle-avatar-png-transparent-png.png',
                                fullName: userData?.fullName ?? 'null',
                                greetingsText: Greetings.getGreetingsByTime(),
                                selectedDivision:
                                    Get.find<DashboardController>().selectedDivision,
                                updateSelectedDivision: Get.find<DashboardController>()
                                    .updateSelectedDivision,
                              ),
                          )
                          : const SizedBox(),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.only(bottom: Dimensions.padding10 * 1.2, left: Dimensions.padding10 * 1.2, right: Dimensions.padding10 * 1.2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DashboardHeader(onTapFindService: () => Get.find<HomePageController>().updateIndex(1)),
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
                                  itemCount: Get.find<DashboardController>()
                                      .allServices
                                      .length,
                                  itemBuilder: (context, index) {
                                    final service =
                                        Get.find<DashboardController>()
                                            .allServices[index];
                                    return ServicesCard(
                                        onTap: () {
                                          Get.toNamed(
                                              RouteHelper.getSubServicesPage(
                                                  service.uid!));
                                        },
                                        title: service.name ?? ' null',
                                        iconPath: service.icon ?? 'null');
                                  }),
                            ),


                            ///NEAR YOU
                            // Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Expanded(
                            //       child: SmallText(
                            //         textAlign: TextAlign.start,
                            //         text:
                            //             'Technicians in ${dashboardController.selectedDivision}',
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //     CustomTextButton(
                            //         text: 'See all', onTap: () {})
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: Dimensions.height10,
                            // ),
                          ],
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 0.9,
                          height: Dimensions.height20*10,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          enableInfiniteScroll: true,
                        ),
                        items: bannerUrls.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.all(Dimensions.padding5),
                                child: CachedNetworkImage(
                                    imageUrl: i!,
                                    imageBuilder: (context, imageProvider) => Container(
                                      height: Dimensions.height20 * 10,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(Dimensions.radius12/2),
                                          image: DecorationImage(
                                              image: imageProvider, fit: BoxFit.cover)),
                                    ),
                                    placeholder: (context, url) => ShimmerWidgetContainer(
                                      height: Dimensions.height20 * 10,
                                      width: double.maxFinite,)),
                              );
                            },
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              );
            });
          }
        ));
  }
}
