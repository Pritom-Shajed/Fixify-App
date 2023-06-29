import 'package:fixify_app/controller/auth/auth_signin_controller.dart';
import 'package:fixify_app/controller/auth/auth_signup_controller.dart';
import 'package:fixify_app/controller/signout/signout_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => AuthSignInController(), fenix: true);
  Get.lazyPut(() => AuthSignUpController(), fenix: true);
  Get.lazyPut(() => SignOutController(), fenix: true);
  Get.lazyPut(() => TechnicianPageController(), fenix: true);
}