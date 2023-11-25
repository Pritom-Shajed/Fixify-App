import 'package:fixify_app/controller/home/dashboard_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/home/customer/dashboard_technician_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTechnicianPage extends StatelessWidget {
  const AllTechnicianPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final technicianInfo = Get.find<DashboardController>().technicianInfo;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text('Technicians'),
      ),
      body:  ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: Dimensions.height10,
            );
          },
          shrinkWrap: true,
          physics:
          const NeverScrollableScrollPhysics(),
          itemCount: technicianInfo.length,
          itemBuilder: (context, index) {
            final technician = technicianInfo
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
              '${technician.time1} - ${technician
                  .time2}',
              location: technician.division ??
                  'null',
              services:
              technician.services?.join(', ') ??
                  'null',
            );
          }),
    );
  }
}
