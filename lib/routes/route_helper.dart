import 'package:fixify_app/pages/auth/authentication_page.dart';
import 'package:fixify_app/pages/splashscreen/splashscreen_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static String splashScreen = '/splash-screen';
  static String authPage = '/auth-page';

  static String getSplashScreen ()=> splashScreen;
  static String getAuthPage ()=> authPage;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: ()=> const SplashScreen()),
    GetPage(name: authPage, transition: Transition.fadeIn, page: ()=> const AuthPage()),
  ];
}