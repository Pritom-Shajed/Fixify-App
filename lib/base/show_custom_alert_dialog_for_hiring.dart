import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialogDialogForHiring extends StatefulWidget {
  final TextEditingController textEditingController;
  final int totalServicesOffered;
  final List servicesName;
  final String hintText;
  final String button1Text;
  final String button2Text;
  final VoidCallback onTapYes;
  final VoidCallback? onTapNo;
  final ValueChanged<String> onTapSelectService;
  final List<String> selectedServices;

  const CustomAlertDialogDialogForHiring({
    Key? key,
    required this.textEditingController,
    required this.totalServicesOffered,
    required this.servicesName,
    required this.hintText,
    this.button1Text = 'Hire',
    this.button2Text = 'Cancel',
    required this.onTapYes,
    this.onTapNo,
    required this.onTapSelectService,
    required this.selectedServices,
  }) : super(key: key);

  @override
  State<CustomAlertDialogDialogForHiring> createState() =>
      _CustomAlertDialogDialogForHiringState();
}

class _CustomAlertDialogDialogForHiringState
    extends State<CustomAlertDialogDialogForHiring> {
  @override
  Widget build(BuildContext context) {

    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius12)),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: Dimensions.padding15 * 2,
        horizontal: Dimensions.padding15,
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SmallText(text: 'Select Service'),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.margin10),
              height: Dimensions.height20 * 2,
              width: double.maxFinite,
              alignment: Alignment.topLeft,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                        width: Dimensions.width10,
                      ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.totalServicesOffered,
                  itemBuilder: (context, index) {
                    final service = widget.servicesName[index];
                    final isSelected =
                        widget.selectedServices.contains(service);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.onTapSelectService(service);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.padding5 / 2),
                        alignment: Alignment.center,
                        width: Dimensions.width150 / 1.5,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius4),
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.primaryColor.withOpacity(0.08)),
                        child: SmallText(
                          text: service,
                          color:isSelected
                              ? AppColors.whiteColor : AppColors.primaryColor,
                        ),
                      ),
                    );
                  }),
            ),
            const SmallText(text: 'Job Description'),
            SizedBox(height: Dimensions.height10),
            TextField(
              controller: widget.textEditingController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: Dimensions.font12),
                filled: true,
                fillColor: AppColors.textFieldColor,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.greyColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(Dimensions.radius4)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.greyColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(Dimensions.radius4)),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.padding15),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          text: widget.button1Text, onTap: widget.onTapYes)),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Expanded(
                      child: CustomButton(
                          text: widget.button2Text,
                          onTap: widget.onTapNo ?? () => Get.back()))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
