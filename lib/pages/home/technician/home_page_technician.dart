import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/base/show_custom_alert_dialog_with_btn.dart';
import 'package:fixify_app/base/show_custom_loader.dart';
import 'package:fixify_app/controller/signout/signout_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/pages/home/technician/technician_work_info.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_multiselect_button.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_view_short.dart';
import 'package:fixify_app/widgets/switches/toggle_switch.dart';
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
        backgroundColor: AppColors.mainBgColor,
        body: GetBuilder<TechnicianPageController>(
          builder: (controller) {
            final userData = controller.userInfoTechnician;
            return userData == null
                ? showCustomLoader()
                : Container(
              padding: EdgeInsets.only(
                  top: Dimensions.padding10 * 4,
                  left: Dimensions.padding10,
                  right: Dimensions.padding10,
                  bottom: Dimensions.padding10),
              color: AppColors.mainBgColor,
              child: Column(
                children: [
                  TechnicianProfileViewShort(
                      fullName: userData.fullName!,
                      email: userData.email!,
                      phoneNumber: userData.phoneNumber!,
                      joinedDate: userData.joinedDate!,
                      profilePicUrl: userData.profilePic!,
                      onTapEditProfile: () {}),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              CustomToggleSwitch(
                                current: _about,
                                firstText: 'About',
                                secondText: 'Work',
                                onChanged: (value) {
                                  setState(() {
                                    _about = !_about;
                                  });
                                },
                              ),
                              CustomButton(
                                  text: 'Signout',
                                  onTap: () {
                                    showDialog(
                                        context: context, builder: (context) {
                                      return CustomAlertDialogWithBtn(
                                          titleText: 'Sign out?',
                                          onTapYes: () => SignOutController.signOut(context),
                                          onTapNo: () => Get.back());
                                    });

                                  }),
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
                              title1: 'Current Works',
                              number1: '0',
                              title2: 'Works Done',
                              number2: '${userData.worksDone}',
                              title3: 'Services Offered',
                              number3: '${userData.services!.length}',
                              title4: 'Weekly Fee',
                              number4:
                              '${userData.availableDays!.length}',
                              subtile4: 'days',
                            ),
                            secondChild: const Center(
                              child: Text('About'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
