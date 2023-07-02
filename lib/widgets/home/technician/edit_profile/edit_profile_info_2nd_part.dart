import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_multiselect_button.dart';
import 'package:fixify_app/widgets/buttons/custom_time_picker.dart';
import 'package:fixify_app/widgets/container/custom_container.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class EditProfileInfo2ndPart extends StatelessWidget {
  final TextEditingController preferredAreaController;
  final List newServicesOffered;
  final List newWorkDays;
  final Function(List<Object?>)? onConfirmServices;
  final Function(List<Object?>)? onConfirmWorkDays;
  final Function(Time) onTimeChanged1;
  final Function(Time) onTimeChanged2;
  final Time? time1;
  final Time? time2;

  final List totalWorkDays = [
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    'Sat'
  ];
  final  List totalServices = [
    'Fridge',
    'AC',
    'Fan',
  ];

   EditProfileInfo2ndPart({
    Key? key,
    required this.preferredAreaController,
    required this.onConfirmWorkDays,
    required this.newWorkDays,
    required this.onTimeChanged1,
    required this.onTimeChanged2,
    required this.time1,
    required this.time2,
    required this.newServicesOffered,
    required this.onConfirmServices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.margin10),
      child: TechnicianProfilePreviewCard(children: [
        CustomTextField(
          required: false,
          titleText: 'Preferred Area',
          controller: preferredAreaController,
        ),
        CustomMultiSelectButton(
            required: true,
            titleText: 'Services',
            multiSelectWidget: MultiSelectDialog(
              height: Dimensions.screenHeight * 0.25,
              selectedColor: AppColors.primaryColor,
              items: totalServices
                  .map((e) => MultiSelectItem(e, e))
                  .toList(),
              initialValue: newServicesOffered,
              onConfirm: onConfirmServices,
            ),
            initialValue: newServicesOffered,
            hintText: 'Select Services',
            children: List.generate(newServicesOffered.length, (index) {
              var services = newServicesOffered[index];
              return CustomContainer(titleText: services);
            })),
        CustomMultiSelectButton(
            required: true,
            titleText: 'Work Days',
            multiSelectWidget: MultiSelectDialog(
                height: Dimensions.screenHeight * 0.25,
                selectedColor: AppColors.primaryColor,
                items: totalWorkDays
                    .map((e) => MultiSelectItem(e, e))
                    .toList(),
                initialValue: newWorkDays,
                onConfirm: onConfirmWorkDays),
            initialValue: newWorkDays,
            hintText: 'Work Days',
            children: List.generate(newWorkDays.length, (index) {
              var days = newWorkDays[index];
              return CustomContainer(titleText: days);
            })),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWithStar(
              fontSize: Dimensions.font12,
              text: 'Work Time',
              starEnable: false,
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
                time1: time1,
                time2: time2,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
