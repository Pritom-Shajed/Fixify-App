import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/model/days_model.dart';
import 'package:fixify_app/model/factory_data/factory_data.dart';
import 'package:fixify_app/pages/home/technician/edit_profile/edit_profile_info_1st_part.dart';
import 'package:fixify_app/pages/home/technician/edit_profile/edit_profile_info_2nd_part.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/buttons/custom_multiselect_button.dart';
import 'package:fixify_app/widgets/buttons/custom_time_picker.dart';
import 'package:fixify_app/widgets/container/custom_container.dart';
import 'package:fixify_app/widgets/home/technician/technician_dp_with_edit_btn.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/shimmer_effect/circle_shimmer_widget.dart';
import 'package:fixify_app/widgets/text_fields/custom_dropdown_form_field.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../widgets/buttons/custom_button.dart';

class EditProfileTechnician extends StatefulWidget {
  const EditProfileTechnician({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileTechnician> createState() => _EditProfileTechnicianState();
}

class _EditProfileTechnicianState extends State<EditProfileTechnician> {
  final technicianController = Get.find<TechnicianPageController>();
  final _pageController = PageController();
  late TextEditingController nickNameController;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController preferredAreaController;
  final List _totalWorkDays = [
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    'Sat'
  ];
  final List _totalServices = [
    'Fridge',
    'AC',
    'Fan',
  ];
  List _newWorkDays = [];
  List _newServices = [];
  String? selectedDivision;

  Time? _time1;
  Time? _time2;
  bool iosStyle = true;

  @override
  void initState() {
    var userData = technicianController.userInfoTechnician!;
    _newWorkDays = userData.workDays!;
    _newServices = userData.services!;
    _time1 = Time(
        hour: int.parse(userData.time1!.substring(0, 2)),
        minute: int.parse(userData.time1!.substring(5, 7)));
    _time2 = Time(
        hour: int.parse(userData.time2!.substring(0, 2)),
        minute: int.parse(userData.time2!.substring(5, 7)));
    nickNameController = TextEditingController(text: userData.nickName);
    fullNameController = TextEditingController(text: userData.fullName);
    emailController = TextEditingController(text: userData.email);
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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.height10,
              horizontal: Dimensions.width10 * 2),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl: userData.profilePic!,
                      imageBuilder: (context, imageProvider) =>
                          TechnicianDpWithEditBtn(
                            imageProvider: imageProvider,
                            onTapEdit: () {},
                          ),
                      placeholder: (context, url) => ShimmerWidgetCircle(
                            radius: Dimensions.technicianViewProfileDpRadius,
                          )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Column(
                    children: [
                      ExpandablePageView(
                          controller: _pageController,
                          children: [
                            EditProfileInfo1stPart(
                                nickNameController: nickNameController,
                                nidNumber: userData.nidNumber!,
                                fullNameController: fullNameController,
                                emailController: emailController,
                                phoneController: phoneController),
                            EditProfileInfo2ndPart(
                              totalServices: _totalServices,
                              newServicesOffered: _newServices,
                              onConfirmServices: (services) {
                                setState(() {
                                  _newServices = services;
                                });
                              },
                              totalWorkDays: _totalWorkDays,
                              newWorkDays: _newWorkDays,
                              onConfirmWorkDays: (days) {
                                setState(() {
                                  _newWorkDays = days;
                                });
                              },
                              currentDivision: userData.division!,
                              onChangedDivision: (division) {
                                setState(() {
                                  selectedDivision = division;
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
