import 'package:fixify_app/controller/customer/home_page_controller.dart';
import 'package:fixify_app/pages/home/customer/dashboard/dashboard_page_customer.dart';
import 'package:fixify_app/pages/home/customer/profile/profile_page_customer.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageCustomer extends StatefulWidget {
  const HomePageCustomer({Key? key}) : super(key: key);

  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();
}

final _controller = Get.find<HomePageController>();

class _HomePageCustomerState extends State<HomePageCustomer> {
  List<Widget> pages = const [DashboardPageCustomer(), ProfilePageCustomer()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: Builder(builder: (context) {
        return Obx(
          () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.blackColor,
              currentIndex: _controller.tabIndex,
              onTap: _controller.updateIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Dashboard'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ]),
        );
      }),
      body: Obx(
        () => pages[_controller.tabIndex],
      ),
    );
  }
}
