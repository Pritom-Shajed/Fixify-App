import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignOutController {
  static Future<void> signOut(BuildContext context) async {
    try {
      final SharedPreferences preferences =
      await SharedPreferences.getInstance();

      await preferences.remove('uid');

      showDefaultSnackBar(isError:false, 'Hope to see you soon!', context);

      Get.offAllNamed(RouteHelper.getAuthPage());
    } catch (e) {
      showDefaultSnackBar(e.toString(), context);
    }
  }
}
