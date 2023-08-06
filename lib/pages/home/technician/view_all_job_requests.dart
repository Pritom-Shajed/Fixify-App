import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/job_requests_card.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllJobRequestsTechnician extends StatelessWidget {
  final String technicianUid;

  const ViewAllJobRequestsTechnician({Key? key, required this.technicianUid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobRequests = Get
        .find<TechnicianHiringController>()
        .allJobRequests
        .where((element) => element.technicianUid == technicianUid)
        .toList();
    return Scaffold(
        backgroundColor: AppColors.mainBgColor,
        appBar: AppBar(
          leading:
          CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1.5,
              vertical: Dimensions.height10),
          child: ListView.builder(
              itemCount: jobRequests.length,
              itemBuilder: (context, index) {
                var job = jobRequests[index];
                return JobRequestCard(services: job.serviceName!.join(', '),
                    description: job.jobDescription!);
              }),
        )
    );
  }
}
