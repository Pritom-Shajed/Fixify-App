import 'package:fixify_app/controller/auth/auth_signin_controller.dart';
import 'package:fixify_app/pages/auth/authentication_page.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final signInController = Get.find<AuthSignInController>();

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) {
      return signInController.checkLoginStatus().then((loggedIn) =>
          {if (!loggedIn) Get.offAllNamed(RouteHelper.getAuthPage())});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColorLight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Dimensions.splashScreenLogoSize200,
                child: Image.asset('assets/icons/fixify_logo.png'),
              ),
              SpinKitWave(
                color: AppColors.primaryColor,
                size: Dimensions.loadingSize16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
