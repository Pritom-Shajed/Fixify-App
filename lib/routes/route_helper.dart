import 'package:fixify_app/model/days_model.dart';
import 'package:fixify_app/pages/auth/authentication_page.dart';
import 'package:fixify_app/pages/home/customer/home_page_customer.dart';
import 'package:fixify_app/pages/home/technician/edit_profile/edit_profile_technician.dart';
import 'package:fixify_app/pages/home/technician/view_profile_technician.dart';
import 'package:fixify_app/pages/home/technician/home_page_technician.dart';
import 'package:fixify_app/pages/splashscreen/splashscreen_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static String splashScreen = '/splash-screen';
  static String authPage = '/auth-page';
  static String homePageCustomer = '/home-customer';
  static String homePageTechnician = '/home-technician';
  static String viewProfileTechnician = '/view-profile-technician';
  static String editProfileTechnician = '/edit-profile-technician';

  static String getSplashScreen() => splashScreen;

  static String getAuthPage() => authPage;

  static String getHomeCustomer() => homePageCustomer;

  static String getHomeTechnician() => homePageTechnician;

  static String getViewProfileTechnician() => viewProfileTechnician;

  static String getEditProfileTechnician(String uid) => '$editProfileTechnician?uid=$uid';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: authPage,
        transition: Transition.fadeIn,
        page: () => const AuthPage()),
    GetPage(
        name: homePageCustomer,
        transition: Transition.fadeIn,
        page: () => const HomePageCustomer()),
    GetPage(
        name: homePageTechnician,
        transition: Transition.fadeIn,
        page: () => const HomePageTechnician()),
    GetPage(
        name: viewProfileTechnician,
        transition: Transition.fadeIn,
        page: () => const ViewProfileTechnician()),
    GetPage(
        name: editProfileTechnician,
        transition: Transition.fadeIn,
        page: () {
          var uid = Get.parameters['uid'];
          return EditProfileTechnician(uid: uid!,);
        }),
  ];
}
