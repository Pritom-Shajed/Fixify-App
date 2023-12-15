import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/widgets/home/technician/show_activity_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicianActivity extends StatelessWidget {
  const TechnicianActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowActiivtyInfo(
            onTap: () {

              Get.toNamed(
                  RouteHelper.getViewAllJobRequestsTechnician(
                    showConfirmOnly: false,
                      technicianUid: Get.find<TechnicianPageController>()
                          .userInfoTechnician!
                          .uid
                          .toString()));
            },
            text: 'Job Requests',
            iconPath: 'assets/icons/job_req.png')
      ],
    );
  }
}
