import 'package:fixify_app/base/show_custom_alert_dialog.dart';
import 'package:fixify_app/base/show_custom_alert_dialog_with_btn.dart';
import 'package:fixify_app/base/show_custom_loader.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/widgets/home/technician/technician_activity.dart';
import 'package:fixify_app/widgets/home/technician/technician_work_info.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/home/technician/technician_home_profile_view.dart';
import 'package:fixify_app/widgets/switches/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePageTechnician extends StatefulWidget {
  const HomePageTechnician({Key? key}) : super(key: key);

  @override
  State<HomePageTechnician> createState() => _HomePageTechnicianState();
}

class _HomePageTechnicianState extends State<HomePageTechnician> {
  bool _about = true;

  bool _isLoading = true;

  Future<void> loadAllData() async {
    await Get.find<TechnicianPageController>().fetchTechnicianUserInfo();
    await Get.find<TechnicianHiringController>().fetchJobRequests();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    loadAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final doneJobs = Get.find<TechnicianHiringController>()
        .allJobRequests
        .where((job) => job.technicianUid == Get.find<TechnicianPageController>().userInfoTechnician?.uid && job.status=='confirmed')
        .toList();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'FIXIFY',
          ),
        ),
        backgroundColor: AppColors.mainBgColor,
        body: _isLoading
            ? showCustomLoader()
            : WillPopScope(
                onWillPop: () async {
                  return showCustomAlertDialogWithBtn(context,
                      titleText: 'Exit Fixify?',
                      onTapYes: () => SystemNavigator.pop(),
                      onTapNo: () => Get.back());
                },
                child: GetBuilder<TechnicianPageController>(
                  builder: (controller) {
                    final userData = controller.userInfoTechnician;
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: Dimensions.padding10,
                            right: Dimensions.padding10,
                            bottom: Dimensions.padding10),
                        color: AppColors.mainBgColor,
                        child: Column(
                          children: [
                            TechnicianHomeProfileViewShort(
                                fullName: userData!.fullName!,
                                email: userData.email!,
                                phoneNumber: userData.phoneNumber!,
                                joinedDate: userData.joinedDate!,
                                profilePicUrl: userData.profilePic!,
                                onTapEditProfile: () => Get.toNamed(
                                    RouteHelper.getViewProfileTechnician())),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomToggleSwitch(
                                  current: _about,
                                  firstText: 'Activity',
                                  secondText: 'Work',
                                  onChanged: (value) {
                                    setState(() {
                                      _about = !_about;
                                    });
                                  },
                                ),
                                CustomButton(
                                  text: 'Signout',
                                  onTap: () =>
                                      showCustomAlertDialogWithBtn(context,
                                          titleText: 'Sign out?',
                                          onTapYes: () {
                                            Get.find<AuthSignOutController>()
                                                .clearSharedData();
                                            Get.offAllNamed(
                                                RouteHelper.getHomePage());
                                          },
                                          onTapNo: () => Get.back()),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            AnimatedCrossFade(
                              crossFadeState: _about
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 300),
                              firstChild: TechnicianWorkInfo(
                                onTap1: () => Get.toNamed(RouteHelper.getViewAllJobRequestsTechnician(technicianUid: userData.uid ?? 'null', showConfirmOnly: true)),
                                onTap2: () => showCustomAlertDialog(context,
                                    titleText: 'Services Offered',
                                    bodyText:
                                        userData.services!.join(', ')),
                                onTap3: () => showCustomAlertDialog(context,
                                    titleText: 'Weekly Free',
                                    bodyText:
                                        userData.workDays!.join(', ')),
                                title1: 'Works Done',
                                number1: '${doneJobs.length}',
                                title2: 'Services Offered',
                                number2: '${userData.services!.length}',
                                title3: 'Weekly Free',
                                number3: '${userData.workDays!.length}',
                                subtitle3: 'days',
                              ),
                              secondChild: const TechnicianActivity(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
