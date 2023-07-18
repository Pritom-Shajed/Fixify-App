import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/base/side_bar.dart';
import 'package:fixify_app/controller/customer/customer_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/buttons/custom_text_button.dart';
import 'package:fixify_app/widgets/home/customer/customer_home_preview_card.dart';
import 'package:fixify_app/widgets/home/customer/dashboard_header.dart';
import 'package:fixify_app/widgets/home/customer/dashboard_technician_card.dart';
import 'package:fixify_app/widgets/home/customer/services_card.dart';
import 'package:fixify_app/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class DashboardPageCustomer extends StatefulWidget {
  const DashboardPageCustomer({Key? key}) : super(key: key);

  @override
  State<DashboardPageCustomer> createState() => _DashboardPageCustomerState();
}

class _DashboardPageCustomerState extends State<DashboardPageCustomer> {
  @override
  void initState() {
    super.initState();
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
      body: GetBuilder<CustomerController>(builder: (customerController) {
        final userData = customerController.userInfoCustomer!;
        return Padding(
          padding: EdgeInsets.all(Dimensions.padding10 * 1.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerHomeProfileViewShort(
                  profilePicUrl: userData.profilePic!,
                  fullName: userData.fullName!),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Dimensions.height10),
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
                        const SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ServicesCard(
                                  title: 'Service 1', icon: Icons.fire_truck),
                              ServicesCard(title: 'Service 2', icon: Icons.bed),
                              ServicesCard(
                                  title: 'Service 3', icon: Icons.door_sliding),
                              ServicesCard(
                                  title: 'Service 4', icon: Icons.ac_unit),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height15,
                        ),

                        ///NEAR YOU
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SmallText(
                              text: 'Near you',
                              fontWeight: FontWeight.w600,
                            ),
                            CustomTextButton(text: 'See all', onTap: () {})
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
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const DashboardTechnicianCard(
                                name: 'Pritom Shajed',
                                imageUrl:
                                    'https://i.pinimg.com/736x/bb/e3/02/bbe302ed8d905165577c638e908cec76.jpg',
                                time: '7 am - 11am',
                                location: 'Dhaka',
                                services: 'Fan, AC, Frige',
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
