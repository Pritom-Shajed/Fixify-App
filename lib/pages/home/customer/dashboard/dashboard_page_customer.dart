import 'package:fixify_app/base/side_bar.dart';
import 'package:fixify_app/controller/customer/customer_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_button.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/home/customer/customer_home_preview_card.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPageCustomer extends StatefulWidget {
  const DashboardPageCustomer({Key? key}) : super(key: key);

  @override
  State<DashboardPageCustomer> createState() => _DashboardPageCustomerState();
}

class _DashboardPageCustomerState extends State<DashboardPageCustomer> {
  bool _isLoading = true;

  Future<void> _loadAllData() async {
    await Get.find<CustomerController>().fetchCustomerUserInfo();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _loadAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      drawer: const SideBar(),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text('Home'),
        actions: [
          CustomIconButton(icon: Icons.notifications, onTap: () {}),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GetBuilder<CustomerController>(builder: (customerController) {
              final userData = customerController.userInfoCustomer!;
              return Column(
                children: [
                  CustomerHomeProfileViewShort(
                      profilePicUrl: userData.profilePic!,
                      fullName: userData.fullName!),
                ],
              );
            }),
    );
  }
}
