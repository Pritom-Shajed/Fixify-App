import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/container/custom_container.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:fixify_app/widgets/texts/text_with_star.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  final String titleText;
  final Function(Time) onTimeChanged1;
  final Function(Time) onTimeChanged2;
  final Time? time1;
  final Time? time2;
  final bool required;

  const CustomTimePicker({
    Key? key,
    required this.titleText,
    this.required = true,
    required this.onTimeChanged1,
    required this.onTimeChanged2,
    required this.time1,
    required this.time2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.padding10,
                horizontal: Dimensions.padding10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: Time(hour: 11, minute: 50),
                        onChange: onTimeChanged1,
                        minuteInterval: TimePickerInterval.FIVE,
                      ),
                    );
                  },
                  child: CustomContainer(
                      titleText: time1 == null
                          ? '00 : 00'
                          : '${time1!.hour} : ${time1!.minute} ${time1!.period.name}'),
                ),
                SmallText(
                  text: 'to',
                  color: AppColors.greyColor,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: Time(hour: 11, minute: 50),
                        onChange: onTimeChanged2,
                        minuteInterval: TimePickerInterval.FIVE,
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          // print(dateTime);
                        },
                      ),
                    );
                  },
                  child: CustomContainer(
                      titleText: time2 == null
                          ? '00 : 00'
                          : '${time2!.hour} : ${time2!.minute} ${time2!.period.name}'),
                ),
              ],
            )),
      ],
    );
  }
}
