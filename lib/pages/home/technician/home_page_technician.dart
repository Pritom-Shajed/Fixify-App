import 'package:fixify_app/base/show_custom_alert_dialog.dart';
import 'package:fixify_app/base/show_custom_alert_dialog_with_btn.dart';
import 'package:fixify_app/base/show_custom_loader.dart';
import 'package:fixify_app/controller/signout/signout_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/widgets/home/technician/technician_work_info.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/home/technician/technician_home_profile_view.dart';
import 'package:fixify_app/widgets/switches/toggle_switch.dart';
import 'package:fixify_app/widgets/texts/medium_text.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageTechnician extends StatefulWidget {
  const HomePageTechnician({Key? key}) : super(key: key);

  @override
  State<HomePageTechnician> createState() => _HomePageTechnicianState();
}

class _HomePageTechnicianState extends State<HomePageTechnician> {
  bool _about = true;
  final technicianPageController = Get.find<TechnicianPageController>();

  @override
  void initState() {
    technicianPageController.fetchTechnicianUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'FIXIFY',
          ),
        ),
        backgroundColor: AppColors.mainBgColor,
        body: GetBuilder<TechnicianPageController>(
          builder: (controller) {
            final userData = controller.userInfoTechnician;
            return userData == null
                ? showCustomLoader()
                : SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.padding10,
                          right: Dimensions.padding10,
                          bottom: Dimensions.padding10),
                      color: AppColors.mainBgColor,
                      child: Column(
                        children: [
                          TechnicianHomeProfileViewShort(
                              fullName: userData.fullName!,
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
                                onTap: () => showCustomAlertDialogWithBtn(
                                    context,
                                    titleText: 'Sign out?',
                                    onTapYes: () =>
                                        SignOutController.signOut(context),
                                    onTapNo: () => Get.back()),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              AnimatedCrossFade(
                                crossFadeState: _about
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 300),
                                firstChild: TechnicianWorkInfo(
                                  onTap3: () => showCustomAlertDialog(context,
                                      titleText: 'Services Offered',
                                      bodyText: userData.services!.join(', ')),
                                  onTap4: () => showCustomAlertDialog(context,
                                      titleText: 'Weekly Free',
                                      bodyText:
                                          userData.workDays!.join(', ')),
                                  title1: 'Current Works',
                                  number1: '0',
                                  title2: 'Works Done',
                                  number2: '${userData.worksDone}',
                                  title3: 'Services Offered',
                                  number3: '${userData.services!.length}',
                                  title4: 'Weekly Free',
                                  number4: '${userData.workDays!.length}',
                                  subtitle4: 'days',
                                ),
                                secondChild: const Center(
                                  child: Text('Activity'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
