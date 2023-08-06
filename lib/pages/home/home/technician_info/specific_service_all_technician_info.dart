import 'package:fixify_app/controller/home/dashboard_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/customer/dashboard_technician_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecificServiceAllTechnicianInfo extends StatelessWidget {
  final String serviceName;
  const SpecificServiceAllTechnicianInfo({Key? key, required this.serviceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allTechnician = Get.find<DashboardController>().technicianInfo.where((element) => element.services!.any((element) => element == serviceName));
    return Scaffold(
      appBar: AppBar(
        leading:
            CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: Dimensions.height10,),
        itemCount: allTechnician.length,
        itemBuilder: (context, index) {
          var technician = allTechnician.toList()[index];
        return DashboardTechnicianCard(
          onTap: () {
            Get.toNamed(RouteHelper
                .getTechnicianInfoPageCustomer(technician.uid!));
          },
          name: technician.nickName ?? 'Null',
          imageUrl: technician.profilePic ??
              'https://i.pinimg.com/736x/bb/e3/02/bbe302ed8d905165577c638e908cec76.jpg',
          time:
          '${technician.time1} - ${technician.time2}',
          location: technician.division ?? 'null',
        );
        },
      ),
    );
  }
}
