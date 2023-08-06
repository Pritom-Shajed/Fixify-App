import 'package:firebase_core/firebase_core.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  await dep.init();
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.whiteColor
    ..backgroundColor = AppColors.blackColor
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fixify',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.appBarColor,
            foregroundColor: AppColors.blackColor,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: AppColors.blackColor,
                letterSpacing: 5,
                fontSize: Dimensions.font16)),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      getPages: RouteHelper.routes,
      initialRoute: RouteHelper.getSplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
