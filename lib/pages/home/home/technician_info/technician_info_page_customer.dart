import 'package:fixify_app/base/show_custom_alert_dialog_for_hiring.dart';
import 'package:fixify_app/base/show_custom_toast.dart';
import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/base/show_fixify_footer.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/controller/home/customer_controller.dart';
import 'package:fixify_app/controller/home/dashboard_controller.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/customer/technician_info_header_customer.dart';
import 'package:fixify_app/widgets/home/customer/technician_info_short_card.dart';
import 'package:fixify_app/widgets/home/technician/technician_info_text.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicianInfoPageCustomer extends StatefulWidget {
  final String technicianUid;

  const TechnicianInfoPageCustomer({Key? key, required this.technicianUid})
      : super(key: key);

  @override
  State<TechnicianInfoPageCustomer> createState() =>
      _TechnicianInfoPageCustomerState();
}

class _TechnicianInfoPageCustomerState
    extends State<TechnicianInfoPageCustomer> {
  @override
  Widget build(BuildContext context) {
    final userData = Get.find<DashboardController>()
        .technicianInfo
        .where((element) => element.uid == widget.technicianUid)
        .single;

    List<String> selectedServices = [];

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
                onTapHire: () {
                 if(Get.find<AuthSignOutController>().userLoggedIn()){
                     showDialog(
                       barrierDismissible: false,
                       context: context,
                       builder: (context) {
                         return CustomAlertDialogDialogForHiring(
                             textEditingController:
                             Get.find<TechnicianHiringController>().hireTextController,
                             hintText: 'Write the job description in details',
                             totalServicesOffered:
                             userData.services?.length ?? 0,
                             servicesName: userData.services!,
                             selectedServices: selectedServices,
                             onTapSelectService: (service) {
                               if (selectedServices.contains(service)) {
                                 selectedServices.remove(service);
                               } else {
                                 selectedServices.add(service);
                               }
                             },
                             onTapYes: () {
                               if(selectedServices.isEmpty){
                                 showDefaultSnackBar(
                                     'Select your preferred service', context);
                               } else if ( Get.find<TechnicianHiringController>()
                                   .hireTextController
                                   .text ==
                                   '') {
                                 showDefaultSnackBar(
                                     'Enter job description', context);
                               } else {
                                 Get.back();

                                 Get.find<TechnicianHiringController>()
                                     .hireRequestTechnician(
                                     context: context,
                                     technicianUid: userData.uid ?? 'null',
                                     customerUid:
                                     Get.find<CustomerController>()
                                         .userInfoCustomer
                                         ?.uid ??
                                         'null',
                                     serviceName: selectedServices,
                                     status: 'on progress')
                                     .whenComplete(() => Get.offNamed(
                                     RouteHelper.getHomePage()));
                               }
                             });
                       });
                 } else {
                   showCustomToast('Sign in to start hiring');
                 }
                },
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
                        ProfilePreviewCard(children: [
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
                                separatorBuilder: (context, index) => SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: userData.services!.length,
                                itemBuilder: (context, index) {
                                  final service = userData.services![index];
                                  return Container(
                                    padding:
                                        EdgeInsets.all(Dimensions.padding5 / 2),
                                    alignment: Alignment.center,
                                    width: Dimensions.width150 / 1.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius4),
                                      color: AppColors.primaryColor
                                          .withOpacity(0.08),
                                    ),
                                    child: SmallText(
                                      text: service,
                                      color: AppColors.primaryColor,
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),

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
