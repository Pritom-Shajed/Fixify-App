import 'package:fixify_app/controller/auth/auth_signin_controller.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/controller/auth/auth_signup_controller.dart';
import 'package:fixify_app/controller/home/customer_controller.dart';
import 'package:fixify_app/controller/home/dashboard_controller.dart';
import 'package:fixify_app/controller/home/home_page_controller.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final preference = await SharedPreferences.getInstance();

  //Shared Preference
  Get.lazyPut(() => preference, fenix: true);

  //Controller
  Get.lazyPut(() => AuthSignInController(preferences: Get.find()), fenix: true);
  Get.lazyPut(() => AuthSignUpController(), fenix: true);
  Get.lazyPut(() => AuthSignOutController(preferences: Get.find()), fenix: true);
  Get.lazyPut(() => CustomerController(sharedPreferences: Get.find()),
      fenix: true);
  Get.lazyPut(() => TechnicianPageController(preferences: Get.find()),
      fenix: true);
  Get.lazyPut(() => HomePageController(), fenix: true);
  Get.lazyPut(() => DashboardController(sharedPreferences: Get.find()),
      fenix: true);
  Get.lazyPut(() => TechnicianHiringController(), fenix: true);

}
