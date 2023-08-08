import 'package:fixify_app/controller/home/customer_controller.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/job_requests_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HiringsPage extends StatelessWidget {
  const HiringsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hirings = Get
        .find<TechnicianHiringController>()
        .allJobRequests
        .where((element) => element.customerUid == Get.find<CustomerController>().userInfoCustomer!.uid)
        .toList();
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          leading:
          CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10 * 1.5,
              vertical: Dimensions.height10),
          child: ListView.builder(
              itemCount: hirings.length,
              itemBuilder: (context, index) {
                var job = hirings[index];
                return JobRequestCard(
                    onTap: () {
                      print(job.technicianUid);
                      Get.find<TechnicianHiringController>()
                          .fetchSpecificTechnicianInfo(job.technicianUid!)
                          .whenComplete(() => Get.toNamed(
                          RouteHelper.getHiringDetailInfo(job.id!)));
                    },
                    bgColor: AppColors.primaryColorLight,
                    services: job.serviceName!.join(', '),
                    description: job.jobDescription!);
              }),
        ));
  }
}
