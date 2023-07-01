import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:fixify_app/model/factory_data/factory_data.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_multiselect_button.dart';
import 'package:fixify_app/widgets/buttons/custom_time_picker.dart';
import 'package:fixify_app/widgets/container/custom_container.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/text_fields/custom_dropdown_form_field.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class EditProfileInfo2ndPart extends StatefulWidget {
  final String currentDivision;
  final Function(dynamic)? onChangedDivision;
  final TextEditingController preferredAreaController;
  final List newServicesOffered;
  final List totalServices;
  final List newWorkDays;
  final List totalWorkDays;
  final Function(List<Object?>)? onConfirmServices;
  final Function(List<Object?>)? onConfirmWorkDays;
  final Function(Time) onTimeChanged1;
  final Function(Time) onTimeChanged2;
  final Time? time1;
  final Time? time2;

  const EditProfileInfo2ndPart({
    Key? key,
    required this.onChangedDivision,
    required this.currentDivision,
    required this.preferredAreaController,
    required this.onConfirmWorkDays,
    required this.newWorkDays,
    required this.onTimeChanged1,
    required this.onTimeChanged2,
    required this.time1,
    required this.time2,
    required this.newServicesOffered,
    required this.onConfirmServices, required this.totalServices, required this.totalWorkDays,
  }) : super(key: key);

  @override
  State<EditProfileInfo2ndPart> createState() => _EditProfileInfo2ndPartState();
}

class _EditProfileInfo2ndPartState extends State<EditProfileInfo2ndPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.margin10),
      child: TechnicianProfilePreviewCard(children: [
        CustomDropDownFormField(
          hintText: widget.currentDivision,
          titleText: 'Division',
          items: FactoryData.divisions.map((division) {
            return DropdownMenuItem(
              value: division,
              child: SmallText(
                text: division.divisionName,
              ),
            );
          }).toList(),
          onChanged: widget.onChangedDivision,
        ),
        CustomTextField(
          required: false,
          titleText: 'Preferred Area',
          controller: widget.preferredAreaController,
        ),
        CustomMultiSelectButton(
            required: true,
            titleText: 'Services',
            multiSelectWidget: MultiSelectDialog(
              height: Dimensions.screenHeight * 0.25,
              selectedColor: AppColors.primaryColor,
              items: widget.totalServices
                  .map((e) => MultiSelectItem(e, e))
                  .toList(),
              initialValue: widget.newServicesOffered,
              onConfirm: widget.onConfirmServices,
            ),
            initialValue: widget.newServicesOffered,
            hintText: 'Select Services',
            children: List.generate(widget.newServicesOffered.length, (index) {
              var services = widget.newServicesOffered[index];
              return CustomContainer(titleText: services);
            })),
        CustomMultiSelectButton(
            required: true,
            titleText: 'Work Days',
            multiSelectWidget: MultiSelectDialog(
                height: Dimensions.screenHeight * 0.25,
                selectedColor: AppColors.primaryColor,
                items: widget.totalWorkDays
                    .map((e) => MultiSelectItem(e, e))
                    .toList(),
                initialValue: widget.newWorkDays,
                onConfirm: widget.onConfirmWorkDays),
            initialValue: widget.newWorkDays,
            hintText: 'Work Days',
            children: List.generate(widget.newWorkDays.length, (index) {
              var days = widget.newWorkDays[index];
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
                onTimeChanged1: widget.onTimeChanged1,
                onTimeChanged2: widget.onTimeChanged2,
                time1: widget.time1,
                time2: widget.time2,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
