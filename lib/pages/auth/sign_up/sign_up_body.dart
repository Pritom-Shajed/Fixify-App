import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/controller/auth/auth_controller.dart';
import 'package:fixify_app/pages/auth/sign_up/customer/customer_sign_up_page.dart';
import 'package:fixify_app/pages/auth/sign_up/technician/technician_sign_up1.dart';
import 'package:fixify_app/pages/auth/sign_up/technician/technician_sign_up_page.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/constants.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/auth/role_button.dart';
import 'package:fixify_app/widgets/auth/sign_up_role_sign.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  UserRole? selectedRole;
  late PageController _controller;
  int pageIndex = 0;
  late TextEditingController signUpNameController;
  late TextEditingController signUpEmailController;
  late TextEditingController signUpPassController;
  late TextEditingController signUpPhoneController;
  late GlobalKey<FormState> formKeyCustomer;

  late AuthController controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    signUpNameController = TextEditingController();
    signUpEmailController = TextEditingController();
    signUpPassController = TextEditingController();
    signUpPhoneController = TextEditingController();
    formKeyCustomer = GlobalKey<FormState>();
    controller = Get.find<AuthController>();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                selectedRole = UserRole.customer;
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
                                selectedRole = UserRole.technician;
                              });
                            },
                          )),
                        ],
                      ),
                      Form(
                        key: formKeyCustomer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                              titleText: 'Username',
                              prefixIcon: Icon(
                                Icons.person,
                                size: Dimensions.icon20,
                              ),
                              hintText: 'Username',
                              controller: signUpNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field can\'t be empty';
                                }
                              },
                            ),
                            CustomTextFormField(
                              titleText: 'Email Address',
                              textInputType: TextInputType.emailAddress,
                              prefixIcon: Icon(
                                Icons.email,
                                size: Dimensions.icon20,
                              ),
                              hintText: 'Email Address',
                              controller: signUpEmailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field can\'t be empty';
                                }
                              },
                            ),
                            Obx(
                              () => CustomTextFormField(
                                titleText: 'Password',
                                suffixIcon: GestureDetector(
                                  onTap: () => controller
                                      .changeObscureTextCustomerSignUp(
                                          !controller
                                              .obscureTextCustomerSignUp),
                                  child: Icon(
                                    controller.obscureTextCustomerSignUp
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: Dimensions.icon20,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: Dimensions.icon20,
                                ),
                                obscureText:
                                    controller.obscureTextCustomerSignUp,
                                hintText: 'Password',
                                controller: signUpPassController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field can\'t be empty';
                                  }
                                },
                              ),
                            ),
                            CustomTextFormField(
                              titleText: 'Phone Number',
                              textInputType: TextInputType.number,
                              prefixIcon: Icon(
                                Icons.phone,
                                size: Dimensions.icon20,
                              ),
                              hintText: '01xxxxxxxxx',
                              controller: signUpPhoneController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field can\'t be empty';
                                }
                              },
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
                                    if (formKeyCustomer.currentState!
                                        .validate()) {
                                      Get.snackbar('Error',
                                          'Select your role to continue',
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          colorText: AppColors.whiteColor);
                                    }
                                  },
                                );
                              } else if (selectedRole == UserRole.customer) {
                                return CustomButton(
                                  text: 'Sign Up',
                                  onTap: () {
                                    if (formKeyCustomer.currentState!
                                        .validate()) {}
                                  },
                                );
                              } else {
                                return CustomButton(
                                  text: 'Proceed',
                                  onTap: () {
                                    if (formKeyCustomer.currentState!
                                        .validate()) {
                                      _controller.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    }
                                  },
                                );
                              }
                            }()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///Technician Page
                TechnicianSignUpPage(onTapBack: () {
                  _controller.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
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
  }
}
