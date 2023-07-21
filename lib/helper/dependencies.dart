import 'package:fixify_app/controller/auth/auth_signin_controller.dart';
import 'package:fixify_app/controller/auth/auth_signup_controller.dart';
import 'package:fixify_app/controller/customer/customer_controller.dart';
import 'package:fixify_app/controller/customer/customer_dashboard_controller.dart';
import 'package:fixify_app/controller/customer/customer_home_page_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final preference = await SharedPreferences.getInstance();

  //Shared Prefence
  Get.lazyPut(() => preference, fenix: true);

  //Controller
  Get.lazyPut(() => AuthSignInController(preferences: Get.find()), fenix: true);
  Get.lazyPut(() => AuthSignUpController(), fenix: true);
  Get.lazyPut(() => CustomerController(sharedPreferences: Get.find()),
      fenix: true);
  Get.lazyPut(() => TechnicianPageController(preferences: Get.find()),
      fenix: true);
  Get.lazyPut(() => HomePageController(), fenix: true);
  Get.lazyPut(() => CustomerDashboardController(sharedPreferences: Get.find()),
      fenix: true);
}
