import 'package:fixify_app/controller/auth/auth_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => AuthController(), fenix: true);
}