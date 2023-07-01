import 'package:firebase_core/firebase_core.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    );
  }
}
