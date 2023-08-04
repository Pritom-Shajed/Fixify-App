import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/repo/auth/auth_repo.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSignOutController extends GetxController {
  final AuthRepo authRepo;

  AuthSignOutController({required this.authRepo});

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }


}
