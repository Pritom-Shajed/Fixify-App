import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/base/show_default_snackbar2.dart';
import 'package:fixify_app/base/show_text_field_validator.dart';
import 'package:fixify_app/controller/auth/auth_controller.dart';
import 'package:fixify_app/pages/auth/sign_up/technician/technician_sign_up.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/constants.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/auth/role_button.dart';
import 'package:fixify_app/widgets/auth/sign_up_role_sign.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpBody extends StatefulWidget {
  final VoidCallback onTapProceedTechnician;
  final VoidCallback onTapProceedCustomer;

  const SignUpBody({
    Key? key,
    required this.onTapProceedTechnician,
    required this.onTapProceedCustomer,
  }) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  UserRole? selectedRole;
  late PageController _controller;
  int pageIndex = 0;
  late TextEditingController signUpNameController;
  late TextEditingController signUpFullNameController;
  late TextEditingController signUpEmailController;
  late TextEditingController signUpPassController;
  late TextEditingController signUpPhoneController;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    signUpNameController = TextEditingController();
    signUpFullNameController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPassController = TextEditingController();
    signUpPhoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColors.primaryColor)),
                    ),
                    child: Text(
                      'Signup',
                      style: TextStyle(
                          color: Colors.black, fontSize: Dimensions.font30),
                    )),
                selectedRole == UserRole.customer
                    ? const SignUpRoleSign(text: 'Customer', icon: Icons.man)
                    : selectedRole == UserRole.technician
                        ? const SignUpRoleSign(
                            text: 'Technician', icon: Icons.construction)
                        : Container(),
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),

            //PAGES
            ExpandablePageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                onPageChanged: (int value) {
                  pageIndex = value;
                  setState(() {});
                },
                children: [
                  ///PAGE 0
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding5 * 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: RoleButton(
                              text: 'Customer',
                              icon: Icons.man,
                              bgColor: selectedRole == UserRole.customer
                                  ? AppColors.primaryColor
                                  : AppColors.whiteColor,
                              textIconColor: selectedRole == UserRole.customer
                                  ? AppColors.whiteColor
                                  : AppColors.primaryColor,
                              onTap: () {
                                setState(() {
                                  if (selectedRole == UserRole.customer) {
                                    selectedRole = null;
                                  } else {
                                    selectedRole = UserRole.customer;
                                  }
                                });
                              },
                            )),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Expanded(
                                child: RoleButton(
                              text: 'Technician',
                              icon: Icons.construction,
                              bgColor: selectedRole == UserRole.technician
                                  ? AppColors.primaryColor
                                  : AppColors.whiteColor,
                              textIconColor: selectedRole == UserRole.technician
                                  ? AppColors.whiteColor
                                  : AppColors.primaryColor,
                              onTap: () {
                                setState(() {
                                  if (selectedRole == UserRole.technician) {
                                    selectedRole = null;
                                  } else {
                                    selectedRole = UserRole.technician;
                                  }
                                });
                              },
                            )),
                          ],
                        ),

                        ///Error Dialog
                        controller.authSignUpError
                            ? showCustomAuthValidator(
                                'Please fill up all required fields')
                            : Container(),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///Full Name
                            CustomTextFormField(
                              titleText: 'Full Name',
                              hintText: 'Full Name',
                              controller: signUpFullNameController,
                            ),

                            ///Username
                            CustomTextFormField(
                              titleText: 'Username',
                              hintText: 'Username',
                              controller: signUpNameController,
                            ),

                            ///Email Address
                            CustomTextFormField(
                              titleText: 'Email Address',
                              textInputType: TextInputType.emailAddress,
                              hintText: 'Email Address',
                              controller: signUpEmailController,
                            ),

                            ///Password
                            CustomTextFormField(
                              titleText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    controller.changeObscureTextSignUp(),
                                child: Icon(
                                  controller.obscureTextSignUp
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: Dimensions.icon20,
                                ),
                              ),
                              obscureText: controller.obscureTextSignUp,
                              hintText: 'Password',
                              controller: signUpPassController,
                            ),
                            CustomTextFormField(
                              titleText: 'Phone Number',
                              textInputType: TextInputType.number,
                              hintText: '01xxxxxxxxx',
                              controller: signUpPhoneController,
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),

                            //Conditional Statement
                            (() {
                              if (selectedRole == null) {
                                return CustomButton(
                                  text: 'Proceed',
                                  onTap: () {
                                    controller.authSignUpErrorCleared();
                                    showCustomSnackBar(
                                        title: 'Error',
                                        'Select your role to continue');
                                  },
                                );
                              } else if (selectedRole == UserRole.customer) {

                                ///Sign Up As Customer
                                return CustomButton(
                                  text: 'Sign Up',
                                  onTap: () {
                                    if (signUpFullNameController.text.isEmpty ||
                                        signUpNameController.text.isEmpty ||
                                        signUpEmailController.text.isEmpty ||
                                        signUpPassController.text.isEmpty ||
                                        signUpPhoneController.text.isEmpty) {
                                      controller.authSignUpErrorOccured();
                                      showDefaultSnackBar(
                                          'Please fill up all required fields',
                                          context);
                                    } else {
                                      controller.authSignUpErrorCleared();
                                      widget.onTapProceedCustomer();
                                      selectedRole = null;
                                      signUpFullNameController.text = '';
                                      signUpNameController.text = '';
                                      signUpPhoneController.text = '';
                                      signUpEmailController.text = '';
                                      signUpPassController.text = '';
                                    }
                                  },
                                );
                              } else {

                                ///Sign Up As Technician
                                return CustomButton(
                                  text: 'Proceed',
                                  onTap: () {
                                    if (signUpFullNameController.text.isEmpty ||
                                        signUpNameController.text.isEmpty ||
                                        signUpEmailController.text.isEmpty ||
                                        signUpPassController.text.isEmpty ||
                                        signUpPhoneController.text.isEmpty) {
                                      controller.authSignUpErrorOccured();
                                      showDefaultSnackBar(
                                          'Please fill up all required fields',
                                          context);
                                    } else {
                                      controller.authSignUpErrorCleared();
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    }
                                  },
                                );
                              }
                            }()),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///Technician Page
                  TechnicianSignUpPage1(onTapProceed: () {
                    widget.onTapProceedTechnician();
                    selectedRole = null;
                    signUpFullNameController.text = '';
                    signUpNameController.text = '';
                    signUpPhoneController.text = '';
                    signUpEmailController.text = '';
                    signUpPassController.text = '';
                    _controller.jumpToPage(0);
                  }, onTapBack: () {
                    _controller.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }),
                ]),
            pageIndex == 0
                ? SizedBox(
                    height: Dimensions.height10,
                  )
                : const SizedBox(),
          ],
        ),
      );
    });
  }
}
