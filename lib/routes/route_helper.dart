import 'package:fixify_app/model/days_model.dart';
import 'package:fixify_app/pages/auth/authentication_page.dart';
import 'package:fixify_app/pages/home/customer/home_page_customer.dart';
import 'package:fixify_app/pages/home/customer/services/service_detail_page.dart';
import 'package:fixify_app/pages/home/customer/services/sub_services_page.dart';
import 'package:fixify_app/pages/home/customer/technician_info/specific_service_all_technician_info.dart';
import 'package:fixify_app/pages/home/customer/technician_info/technician_info_page_customer.dart';
import 'package:fixify_app/pages/home/technician/edit_profile/edit_profile_technician.dart';
import 'package:fixify_app/pages/home/technician/view_profile_technician.dart';
import 'package:fixify_app/pages/home/technician/home_page_technician.dart';
import 'package:fixify_app/pages/splashscreen/splashscreen_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  //Splash Screen
  static String splashScreen = '/splash-screen';

  //Auth
  static String authPage = '/auth-page';

  //Customer
  static String homePageCustomer = '/home-customer';
  static String technicianInfoPageCustomer = '/tech-info-customer';
  static String specificServiceAllTechnicianInfo = '/specific-service-all-technician-info-customer';
  static String subServicesPage = '/sub-service-page';
  static String serviceDetailPage = '/services-detail-page';

  //Technician
  static String homePageTechnician = '/home-technician';
  static String viewProfileTechnician = '/view-profile-technician';
  static String editProfileTechnician = '/edit-profile-technician';

  static String getSplashScreen() => splashScreen;

  static String getAuthPage() => authPage;

  //Customer
  static String getHomeCustomer() => homePageCustomer;

  static String getTechnicianInfoPageCustomer(String uid) =>
      '$technicianInfoPageCustomer?uid=$uid';

  static String getSpecificServiceAllTechnicianInfo(String serviceName) =>
      '$specificServiceAllTechnicianInfo?serviceName=$serviceName';

  static String getSubServicesPage(String uid) => '$subServicesPage?uid=$uid';

  static String getServiceDetailPage({required String index, required String uid}) =>
      '$serviceDetailPage?index=$index&uid=$uid';


  //Technician
  static String getHomeTechnician() => homePageTechnician;

  static String getViewProfileTechnician() => viewProfileTechnician;

  static String getEditProfileTechnician(String uid) =>
      '$editProfileTechnician?uid=$uid';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: authPage,
        transition: Transition.cupertino,
        page: () => const AuthPage()),

    //Customer
    GetPage(
        name: homePageCustomer,
        transition: Transition.cupertino,
        page: () => const HomePageCustomer()),

    GetPage(
        name: serviceDetailPage,
        transition: Transition.cupertino,
        page: () {
          var uid = Get.parameters['uid']!;
          var index = Get.parameters['index']!;
          return ServiceDetailPage(
            uid: uid,
            index: int.parse(index),
          );
        }),

    GetPage(
        name: subServicesPage,
        transition: Transition.cupertino,
        page: () {
          var uid = Get.parameters['uid']!;
          return SubServicePage(
            uid: uid,
          );
        }),

    GetPage(
        name: specificServiceAllTechnicianInfo,
        transition: Transition.cupertino,
        page: () {
          var serviceName = Get.parameters['serviceName']!;
          return SpecificServiceAllTechnicianInfo(
            serviceName: serviceName,
          );
        }),

    GetPage(
        name: technicianInfoPageCustomer,
        transition: Transition.cupertino,
        page: () {
          var uid = Get.parameters['uid']!;
          return TechnicianInfoPageCustomer(
            uid: uid,
          );
        }),

    //Technician
    GetPage(
        name: homePageTechnician,
        transition: Transition.cupertino,
        page: () => const HomePageTechnician()),
    GetPage(
        name: viewProfileTechnician,
        transition: Transition.cupertino,
        page: () => const ViewProfileTechnician()),
    GetPage(
        name: editProfileTechnician,
        transition: Transition.cupertino,
        page: () {
          var uid = Get.parameters['uid'];
          return EditProfileTechnician(
            uid: uid!,
          );
        }),
  ];
}
