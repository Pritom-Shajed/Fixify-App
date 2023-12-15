import 'package:fixify_app/base/show_custom_alert_dialog_with_btn.dart';
import 'package:fixify_app/base/show_custom_loader.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/controller/home/customer_controller.dart';
import 'package:fixify_app/controller/home/dashboard_controller.dart';
import 'package:fixify_app/controller/home/home_page_controller.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/pages/home/home/technician/all_technician_page.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dashboard/dashboard_page.dart';
import 'profile/profile_page_customer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final _controller = Get.find<HomePageController>();

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const DashboardPage(),
    const AllTechnicianPage(),
    const ProfilePageCustomer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: Builder(builder: (context) {
        return Obx(
              () =>
              BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.blackColor,
                  currentIndex: _controller.tabIndex,
                  onTap: _controller.updateIndex,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.plumbing), label: 'Technicians'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_2_outlined),
                        label: 'Account'),
                  ]),
        );
      }),
      body: Obx(() =>
          WillPopScope(
              onWillPop: () async {
                if (_controller.tabIndex == 1) {
                  _controller.updateIndex(0);
                  return false;
                } else {
                  return showCustomAlertDialogWithBtn(
                      context, titleText: 'Exit Fixify?',
                      onTapYes: () => SystemNavigator.pop(),
                      onTapNo: ()=> Get.back());
                }
              }, child: pages[_controller.tabIndex])),
    );
  }
}
