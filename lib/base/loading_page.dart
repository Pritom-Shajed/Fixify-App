import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBgColor,
      body: Center(
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
    );
  }
}