import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/base/show_custom_alert_dialog_with_btn.dart';
import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/technician/edit_profile/edit_profile_info_1st_part.dart';
import 'package:fixify_app/widgets/home/technician/edit_profile/edit_profile_info_2nd_part.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/home/technician/technician_dp_with_edit_btn.dart';
import 'package:fixify_app/widgets/shimmer_effect/circle_shimmer_widget.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../widgets/buttons/custom_button.dart';

class EditProfileTechnician extends StatefulWidget {
  final String uid;

  const EditProfileTechnician({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<EditProfileTechnician> createState() => _EditProfileTechnicianState();
}

class _EditProfileTechnicianState extends State<EditProfileTechnician> {
  final technicianController = Get.find<TechnicianPageController>();
  final _pageController = PageController();
  late TextEditingController nickNameController;
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController preferredAreaController;

  List _newWorkDays = [];
  List _newServices = [];
  late String selectedDivision;

  Time? _time1;
  Time? _time2;
  bool iosStyle = true;

  @override
  void initState() {
    var userData = technicianController.userInfoTechnician!;
    selectedDivision = userData.division!;
    _newWorkDays = userData.workDays!;
    _newServices = userData.services!;
    _time1 = Time(
        hour: int.parse(userData.time1!.substring(0, 2)),
        minute: int.parse(userData.time1!.substring(5, 7)));
    _time2 = Time(
        hour: int.parse(userData.time2!.substring(0, 2)),
        minute: int.parse(userData.time2!.substring(4, 6)));
    nickNameController = TextEditingController(text: userData.nickName);
    fullNameController = TextEditingController(text: userData.fullName);
    phoneController = TextEditingController(text: userData.phoneNumber);
    preferredAreaController =
        TextEditingController(text: userData.preferredArea);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userData = technicianController.userInfoTechnician!;
    return Scaffold(
      backgroundColor: AppColors.mainBgColor,
      appBar: AppBar(
        title: const Text('EDIT PROFILE'),
        leading:
        CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.height10, horizontal: Dimensions.width10),
        child: Center(
          child: Column(
            children: [
              CachedNetworkImage(
                  imageUrl: userData.profilePic!,
                  imageBuilder: (context, imageProvider) =>
                      DpWithEditBtn(
                        imageProvider: imageProvider,
                        onTapEdit: () {
                          technicianController
                              .pickImage(ImageSource.gallery)
                              .then((value) {
                            technicianController.technicianProfilePic != null
                                ? showCustomAlertDialogWithBtn(context,
                                    titleText: 'Update Profile Picture?',
                                    onTapYes: () => technicianController
                                        .updateTechnicianProfilePicture(
                                            widget.uid, context),
                                    onTapNo: () => Get.back())
                                : null;
                          });
                        },
                      ),
                  placeholder: (context, url) => ShimmerWidgetCircle(
                        radius: Dimensions.viewProfileDpRadius,
                      )),
              SizedBox(
                height: Dimensions.height10,
              ),
              SmallText(
                text: 'PROFILE PHOTO',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExpandablePageView(
                          controller: _pageController,
                          children: [
                            EditProfileInfo1stPart(
                                nickNameController: nickNameController,
                                fullNameController: fullNameController,
                                phoneController: phoneController,
                                currentDivision: selectedDivision,
                                onChangedDivision: (value) {
                                  setState(() {
                                    selectedDivision = value;
                                  });
                                }),
                            EditProfileInfo2ndPart(
                              newServicesOffered: _newServices,
                              onConfirmServices: (services) {
                                setState(() {
                                  _newServices = services;
                                });
                              },
                              newWorkDays: _newWorkDays,
                              onConfirmWorkDays: (days) {
                                setState(() {
                                  _newWorkDays = days;
                                });
                              },
                              preferredAreaController: preferredAreaController,
                              onTimeChanged1: (Time newTime) {
                                setState(() {
                                  _time1 = newTime;
                                });
                              },
                              onTimeChanged2: (Time newTime) {
                                setState(() {
                                  _time2 = newTime;
                                });
                              },
                              time1: _time1,
                              time2: _time2,
                            ),
                          ]),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 2,
                        effect: SwapEffect(
                          activeDotColor: AppColors.blackColor,
                          dotHeight: Dimensions.sliderDotSize,
                          dotWidth: Dimensions.sliderDotSize,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      CustomButton(
                          text: 'UPDATE PROFILE',
                          onTap: () {
                              if (fullNameController.text !=
                                      userData.fullName ||
                                  nickNameController.text !=
                                      userData.nickName ||
                                  phoneController.text !=
                                      userData.phoneNumber ||
                                  selectedDivision != userData.division ||
                                  preferredAreaController.text !=
                                      userData.preferredArea ||
                                  _newServices != userData.services ||
                                  _newWorkDays != userData.workDays ||
                                  '${_time1!.hour} : ${_time1!.minute} ${_time1!.period.name}' !=
                                      userData.time1 ||
                                  '${_time2!.hour} : ${_time2!.minute} ${_time2!.period.name}' !=
                                      userData.time2) {
                                technicianController.updateTechnicianUserInfo(
                                    widget.uid, context,
                                    fullName: fullNameController.text,
                                    nickName: nickNameController.text,
                                    phoneNumber: phoneController.text,
                                    division: selectedDivision,
                                    preferredArea: preferredAreaController.text,
                                    services: _newServices,
                                    workDays: _newWorkDays,
                                    time1:
                                        '${_time1!.hour} : ${_time1!.minute} ${_time1!.period.name}',
                                    time2:
                                        '${_time2!.hour} : ${_time2!.minute} ${_time2!.period.name}');
                              } else {
                                showDefaultSnackBar(isError: false,'Make some changes to update', context);
                              }
                          }),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
