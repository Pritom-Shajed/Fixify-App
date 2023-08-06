import 'dart:async';
import 'package:fixify_app/controller/auth/auth_signin_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
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
    Timer(
        const Duration(milliseconds: 700),
        () =>  Get.find<AuthSignInController>().checkLoginStatus().then((isLoggedIn) {
          if(!isLoggedIn) {
            Get.offAllNamed(RouteHelper.getHomePage());
          }
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Dimensions.splashScreenLogoSize200,
                child: Image.asset('assets/icons/fixify_logo.png'),
              ),
              const SmallText(text: 'Simplifying Technician Solutions'),

            ],
          ),
        ),
      ),
    );
  }
}
