import 'package:firebase_core/firebase_core.dart';
import 'package:fixify_app/controller/auth/auth_signin_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        appBarTheme: AppBarTheme(color: AppColors.primaryColor),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      getPages: RouteHelper.routes,
      initialRoute: RouteHelper.getSplashScreen(),
    );
  }
}
