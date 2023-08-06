import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/base/show_text_field_validator.dart';
import 'package:fixify_app/controller/auth/auth_signup_controller.dart';
import 'package:fixify_app/controller/home/dashboard_controller.dart';
import 'package:fixify_app/model/days_model.dart';
import 'package:fixify_app/model/factory_data/factory_data.dart';
import 'package:fixify_app/model/firebase/services_model.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/buttons/custom_multiselect_button.dart';
import 'package:fixify_app/widgets/buttons/custom_time_picker.dart';
import 'package:fixify_app/widgets/container/custom_container.dart';
import 'package:fixify_app/widgets/text_fields/custom_dropdown_form_field.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../../utils/dimensions.dart';

class TechnicianSignUpPage1 extends StatefulWidget {
  final VoidCallback onTapBack;
  final VoidCallback onTapProceed;
  final String userRole;
  final String fullNameController;
  final String nickNameController;
  final String emailController;
  final String passController;
  final String phoneNumberController;

  const TechnicianSignUpPage1(
      {Key? key,
      required this.onTapBack,
      required this.onTapProceed,
      required this.userRole,
      required this.fullNameController,
      required this.nickNameController,
      required this.emailController,
      required this.passController,
      required this.phoneNumberController})
      : super(key: key);

  @override
  State<TechnicianSignUpPage1> createState() => _TechnicianSignUpPage1State();
}

class _TechnicianSignUpPage1State extends State<TechnicianSignUpPage1> {
  late TextEditingController nidCardController;
  late TextEditingController locationController;
  int pageIndex = 0;
  String? selectedDivision;

  @override
  void initState() {
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
    return GetBuilder<AuthSignUpController>(builder: (authController) {
      return Column(
        children: [
          ///Upload Profile Picture

          ///Error Dialog
          authController.authSignUpError
              ? showCustomAuthValidator('Please fill up all required fields')
              : Container(),

          ///Division
          CustomDropDownFormField(
            hintText: 'Division',
            titleText: 'Division',
            items: FactoryData.divisions.map((division) {
              return DropdownMenuItem(
                value: division,
                child: SmallText(
                  text: division,
                ),
              );
            }).toList(),
            onChanged: (division) {
              selectedDivision = division;
            },
          ),

          ///Preferred Area
          CustomTextField(
            titleText: 'Preferred Area',
            hintText: 'Preferred Area',
            controller: locationController,
          ),

          ///NID Card
          CustomTextField(
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
                items: Get.find<DashboardController>().allServices.map((e) => MultiSelectItem(e, e.name!)).toList(),
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
                return CustomContainer(titleText: services.name!);
              })),

          ///Work Days
          CustomMultiSelectButton(
              required: true,
              titleText: 'Work Days',
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
              hintText: 'Work Days',
              children: List.generate(_availableDays.length, (index) {
                var days = _availableDays[index];
                return CustomContainer(titleText: days.day);
              })),

          ///Work Time
          _availableDays.isEmpty
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithStar(
                      fontSize: Dimensions.font12,
                      text: 'Work Time',
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
                onTap: () async {
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
                  } else {
                    authController.authSignUpErrorCleared();

                    await authController.signUpTechnician(
                      context: context,
                      userRole: widget.userRole,
                      fullName: widget.fullNameController,
                      nickName: widget.nickNameController,
                      nidNumber: nidCardController.text,
                      email: widget.emailController,
                      pass: widget.passController,
                      phoneNumber: widget.phoneNumberController,
                      division: selectedDivision!,
                      location: locationController.text,
                      services:
                          _servicesOffered.map((e) => e.name!).toList(),
                      availableDays: _availableDays.map((e) => e.day).toList(),
                      time1:
                          '${_time1!.hour} : ${_time1!.minute} ${_time1!.period.name}',
                      time2:
                          '${_time2!.hour} : ${_time2!.minute} ${_time2!.period.name}',
                    );
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
