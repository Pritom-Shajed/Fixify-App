import 'package:fixify_app/base/show_custom_loader.dart';
import 'package:fixify_app/controller/customer/customer_controller.dart';
import 'package:fixify_app/controller/customer/customer_dashboard_controller.dart';
import 'package:fixify_app/controller/customer/customer_home_page_controller.dart';
import 'package:fixify_app/pages/home/customer/dashboard/dashboard_page_customer.dart';
import 'package:fixify_app/pages/home/customer/profile/profile_page_customer.dart';
import 'package:fixify_app/utils/app_colors.dart';
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

  bool _isLoading = true;

  Future<void> _loadAllData() async {
    await Get.find<CustomerController>().fetchCustomerUserInfo();
    await Get.find<CustomerDashboardController>().fetchAllTechnician();
    await Get.find<CustomerDashboardController>().fetchAllServices();
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
      bottomNavigationBar: _isLoading
          ? null
          : Builder(builder: (context) {
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
      body: _isLoading
          ? showCustomLoader()
          : Obx(
              () => pages[_controller.tabIndex],
            ),
    );
  }
}
