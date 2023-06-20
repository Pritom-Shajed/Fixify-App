import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fixify_app/pages/auth/sign_up/customer/customer_sign_up_page.dart';
import 'package:fixify_app/pages/auth/sign_up/technician/technician_sign_up_page.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/constants.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/auth/role_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
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

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
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
          Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 3, color: AppColors.primaryColor)),
              ),
              child: Text(
                'Signup',
                style:
                    TextStyle(color: Colors.black, fontSize: Dimensions.font30),
              )),
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
                //PAGE 0
                Padding(
                  padding:EdgeInsets.symmetric(vertical: Dimensions.padding5 * 2),
                  child: Row(
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
                ),

                //PAGE 1
                CustomerSignUpPage(
                  onTapBack: () {
                    _controller.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),

                //PAGE 2
                TechnicianSignUpPage(onTapBack: () {
                  _controller.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                }),
              ]),
          pageIndex == 0 ? SizedBox(
            height: Dimensions.height10,
          ):const SizedBox(),

          //BUTTON
          pageIndex == 0
              ? Center(
                  child: CustomIconButton(
                      icon: Icons.arrow_forward,
                      iconSize: Dimensions.icon15,
                      radius: Dimensions.radius20,
                      onTap: () {
                        selectedRole == UserRole.customer
                            ? _controller.animateToPage(1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease)
                            : selectedRole == UserRole.technician
                                ? _controller.animateToPage(2,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease)
                                : Get.snackbar(
                                    'Select your role',
                                    'Select customer or technician to continue',
                                    backgroundColor: AppColors.primaryColor,
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.TOP,
                                  );
                      }),
                )
              : Container(),
        ],
      ),
    );
  }
}
