import 'dart:io';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/base/show_default_snackbar2.dart';
import 'package:fixify_app/base/show_text_field_validator.dart';
import 'package:fixify_app/controller/auth/auth_controller.dart';
import 'package:fixify_app/model/days_model.dart';
import 'package:fixify_app/model/division_model.dart';
import 'package:fixify_app/model/factory_data/factory_data.dart';
import 'package:fixify_app/model/services_model.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/buttons/custom_multiselect_button.dart';
import 'package:fixify_app/widgets/buttons/custom_time_picker.dart';
import 'package:fixify_app/widgets/container/custom_container.dart';
import 'package:fixify_app/widgets/text_fields/custom_dropdown_form_field.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../../utils/dimensions.dart';

class TechnicianSignUpPage1 extends StatefulWidget {
  final VoidCallback onTapBack;
  final VoidCallback onTapProceed;

  const TechnicianSignUpPage1(
      {Key? key, required this.onTapBack, required this.onTapProceed})
      : super(key: key);

  @override
  State<TechnicianSignUpPage1> createState() => _TechnicianSignUpPage1State();
}

class _TechnicianSignUpPage1State extends State<TechnicianSignUpPage1> {
  late TextEditingController nidCardController;
  late TextEditingController locationController;
  File? _image;
  late PageController _controller;
  int pageIndex = 0;
  DivisionModel? selectedDivision;

  Future getProfileImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);

    _image = imageTemporary;
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    nidCardController = TextEditingController();
    locationController = TextEditingController();
    super.initState();
  }

  List<ServicesModel> _servicesOffered = [];
  List<DaysModel> _availableDays = [];

  Time? _time1;
  Time? _time2;
  bool iosStyle = true;

  void onTimeChanged1(Time newTime) {
    _time1 = newTime;
    setState(() {});
  }

  void onTimeChanged2(Time newTime) {
    _time2 = newTime;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Column(
        children: [
          ///Upload Profile Picture

          ///Error Dialog
          authController.authSignUpError
              ? showCustomAuthValidator((() {
                  if (selectedDivision == null ||
                      locationController.text.isEmpty ||
                      nidCardController.text.isEmpty ||
                      _servicesOffered.isEmpty ||
                      _availableDays.isEmpty ||
                      _time1 == null ||
                      _time2 == null) {
                    return 'Please fill up all required fields';
                  } else {
                    return 'Please add your profile picture';
                  }
                }()))
              : Container(),

          ExpandablePageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (int value) {
                pageIndex = value;
                setState(() {});
              },
              children: [
                Column(
                  children: [
                    Container(
                      height: Dimensions.profileImageSize,
                      width: Dimensions.profileImageSize,
                      decoration: BoxDecoration(
                          color: AppColors.greyColorLight,
                          borderRadius: BorderRadius.circular(4),
                          image: _image != null
                              ? DecorationImage(
                                  image: FileImage(_image!), fit: BoxFit.cover)
                              : null,
                          border: Border.all(
                              width: 1, color: AppColors.primaryColorLight)),
                      child: _image == null
                          ? GestureDetector(
                              onTap: () => getProfileImage(),
                              child: Icon(
                                Icons.file_upload_outlined,
                                color: AppColors.primaryColorLight,
                              ))
                          : Container(),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    GestureDetector(
                      onTap: () => getProfileImage(),
                      child: _image == null
                          ? SmallText(
                              text: 'Add Profile Picture',
                              color: AppColors.primaryColor)
                          : SmallText(
                              text: 'Change Profile Picture',
                              color: AppColors.greyColor,
                            ),
                    ),
                  ],
                ),
              ]),

          ///Division
          CustomDropDownFormField(
            hintText: 'Division',
            titleText: 'Division',
            items: FactoryData.divisions.map((division) {
              return DropdownMenuItem(
                value: division,
                child: SmallText(
                  text: division.divisionName,
                ),
              );
            }).toList(),
            onChanged: (division) {
              selectedDivision = division;
            },
          ),

          ///Location
          CustomTextFormField(
            titleText: 'Location',
            hintText: 'Location',
            controller: locationController,
          ),

          ///NID Card
          CustomTextFormField(
            titleText: 'NID Card',
            hintText: 'NID Card number',
            textInputType: TextInputType.number,
            controller: nidCardController,
          ),

          ///MultiSelect
          ///Services
          CustomMultiSelectButton(
              required: true,
              titleText: 'Services',
              multiSelectWidget: MultiSelectDialog(
                height: Dimensions.screenHeight * 0.25,
                selectedColor: AppColors.primaryColor,
                items: FactoryData.services
                    .map((e) => MultiSelectItem(e, e.name))
                    .toList(),
                initialValue: _servicesOffered,
                onConfirm: (values) {
                  _servicesOffered = values;
                  setState(() {});
                },
              ),
              initialValue: _servicesOffered,
              hintText: 'Select Services',
              children: List.generate(_servicesOffered.length, (index) {
                var services = _servicesOffered[index];
                return CustomContainer(titleText: services.name);
              })),

          ///Available Days
          CustomMultiSelectButton(
              required: true,
              titleText: 'Available Days',
              multiSelectWidget: MultiSelectDialog(
                height: Dimensions.screenHeight * 0.25,
                selectedColor: AppColors.primaryColor,
                items: FactoryData.days
                    .map((e) => MultiSelectItem(e, e.day))
                    .toList(),
                initialValue: _availableDays,
                onConfirm: (values) {
                  _availableDays = values;
                  setState(() {});
                },
              ),
              initialValue: _availableDays,
              hintText: 'Available Days',
              children: List.generate(_availableDays.length, (index) {
                var days = _availableDays[index];
                return CustomContainer(titleText: days.day);
              })),

          ///Available Time
          _availableDays.isEmpty
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithStar(
                      fontSize: Dimensions.font12,
                      text: 'Available Time',
                      starEnable: true,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.padding5,
                          horizontal: Dimensions.padding10),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius4),
                      ),
                      child: CustomTimePicker(
                        titleText: 'Available Time',
                        onTimeChanged1: onTimeChanged1,
                        onTimeChanged2: onTimeChanged2,
                        time1: _time1,
                        time2: _time2,
                      ),
                    ),
                  ],
                ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: 'Proceed',
                onTap: () {
                  if (selectedDivision == null ||
                      locationController.text.isEmpty ||
                      nidCardController.text.isEmpty ||
                      _servicesOffered.isEmpty ||
                      _availableDays.isEmpty ||
                      _time1 == null ||
                      _time2 == null) {
                    authController.authSignUpErrorOccured();
                    showDefaultSnackBar(
                        'Please fill up all required fields', context);
                  } else if (_image == null) {
                    authController.authSignUpErrorOccured();
                    showDefaultSnackBar(
                        'Please add your profile picture', context);
                  } else {
                    authController.authSignUpErrorCleared();
                    widget.onTapProceed();
                  }
                },
              ),
              CustomIconButton(icon: Icons.arrow_back, onTap: widget.onTapBack),
            ],
          )
        ],
      );
    });
  }
}
