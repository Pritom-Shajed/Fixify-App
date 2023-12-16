import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/job_requests_card.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllJobRequestsTechnician extends StatelessWidget {
  final String technicianUid;
  final bool showConfirmOnly;

  const ViewAllJobRequestsTechnician({Key? key, required this.technicianUid, required this.showConfirmOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobRequests = Get.find<TechnicianHiringController>()
        .allJobRequests
        .where((job) => job.technicianUid == technicianUid)
        .toList();
    final confirmedJobs = Get.find<TechnicianHiringController>()
        .allJobRequests
        .where((job) => job.technicianUid == technicianUid && job.status =='confirmed')
        .toList();
    return Scaffold(
        backgroundColor: AppColors.mainBgColor,
        appBar: AppBar(
          leading:
              CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        ),
        body: jobRequests.isEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10 * 1.5,
                    vertical: Dimensions.height10),
                child: const Center(
                  child: MediumText(text: 'No data found!'),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10 * 1.5,
                    vertical: Dimensions.height10),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index)=> SizedBox(height: Dimensions.height10,),
                    itemCount: showConfirmOnly ? confirmedJobs.length : jobRequests.length,
                    itemBuilder: (context, index) {
                      var job = showConfirmOnly ? confirmedJobs[index] : jobRequests[index];
                      return JobRequestCard(
                          onTap: () {
                            Get.find<TechnicianHiringController>()
                                .fetchSpecificCustomerInfo(job.customerUid!)
                                .whenComplete(() => Get.find<
                                        TechnicianHiringController>()
                                    .updateHiringPriceTextEditingController(
                                        job.price ?? '0')
                                    .whenComplete(() => Get.toNamed(RouteHelper
                                        .getViewJobDetailsPageTechnician(
                                            job.id!))));
                          },
                          status: job.status?.toUpperCase() ?? 'null',
                          services: job.serviceName!.join(', '),
                          description: job.jobDescription!);
                    }),
              ));
  }
}
