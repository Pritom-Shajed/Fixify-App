import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/base/show_custom_alert_dialog_with_btn.dart';
import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/controller/home/customer_controller.dart';
import 'package:fixify_app/widgets/buttons/custom_button2.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/home/technician/technician_dp_with_edit_btn.dart';
import 'package:fixify_app/widgets/home/technician/technician_profile_preview_card.dart';
import 'package:fixify_app/widgets/shimmer_effect/circle_shimmer_widget.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileCustomer extends StatefulWidget {
  final String uid;

  const EditProfileCustomer({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<EditProfileCustomer> createState() => _EditProfileCustomerState();
}

class _EditProfileCustomerState extends State<EditProfileCustomer> {
  final customerController = Get.find<CustomerController>();
  late TextEditingController unameController;
  late TextEditingController fullNameController;
  late TextEditingController phoneController;


  @override
  void initState() {
    var userData = customerController.userInfoCustomer!;
    unameController = TextEditingController(text: userData.uname);
    fullNameController = TextEditingController(text: userData.fullName);
    phoneController = TextEditingController(text: userData.phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userData = customerController.userInfoCustomer!;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading:
        CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        backgroundColor: AppColors.whiteColor,
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
                          customerController
                              .pickImage(ImageSource.gallery)
                              .then((value) {
                            customerController.customerProfilePic != null
                                ? showCustomAlertDialogWithBtn(context,
                                    titleText: 'Update Profile Picture?',
                                    onTapYes: () => customerController
                                        .updateCustomerProfilePicture(
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.margin10),
                        child: ProfilePreviewCard(children: [
                          CustomTextField(
                            required: false,
                            titleText: 'Full Name',
                            controller: fullNameController,
                          ),
                          CustomTextField(
                            required: false,
                            titleText: 'Nick Name',
                            controller: unameController,
                          ),
                          CustomTextField(
                            required: false,
                            titleText: 'Phone',
                            controller: phoneController,
                          ),
                          // CustomDropDownFormField(
                          //   required: false,
                          //   hintText: currentDivision,
                          //   titleText: 'Division',
                          //   items: divisionName.map((division) {
                          //     return DropdownMenuItem(
                          //       value: division,
                          //       child: SmallText(
                          //         text: division,
                          //       ),
                          //     );
                          //   }).toList(),
                          //   onChanged: onChangedDivision,
                          // ),
                        ]),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SizedBox(
                        width: Dimensions.screenWidth / 2,
                        child: CustomButton2(
                          text: 'UPDATE PROFILE',
                          onTap: () {
                            if (fullNameController.text != userData.fullName ||
                                unameController.text != userData.uname ||
                                phoneController.text != userData.phoneNumber) {
                              customerController.updateCustomerUserInfo(
                                widget.uid,
                                context,
                                fullName: fullNameController.text,
                                uname: unameController.text,
                                phoneNumber: phoneController.text,
                              ).whenComplete(() async{
                                await customerController.fetchCustomerUserInfo();
                                Get.back();
                                Get.back();
                              });
                            } else {
                              showDefaultSnackBar(
                                  isError: false,
                                  'Make some changes to update',
                                  context);
                            }
                          },
                        ),
                      ),
                      // CustomButton(
                      //     text: 'UPDATE PROFILE',
                      //     onTap: () {
                      //     }),
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
