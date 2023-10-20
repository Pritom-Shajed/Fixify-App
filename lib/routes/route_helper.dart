import 'package:fixify_app/pages/auth/authentication_page.dart';
import 'package:fixify_app/pages/home/home/hirings/hiring_detail_info_customer.dart';
import 'package:fixify_app/pages/home/home/hirings/hirings_page.dart';
import 'package:fixify_app/pages/home/home/home_page.dart';
import 'package:fixify_app/pages/home/home/notification/notification_page.dart';
import 'package:fixify_app/pages/home/technician/edit_profile/edit_profile_technician.dart';
import 'package:fixify_app/pages/home/technician/job_details_page.dart';
import 'package:fixify_app/pages/home/technician/view_all_job_requests.dart';
import 'package:fixify_app/pages/home/technician/view_profile_technician.dart';
import 'package:fixify_app/pages/home/technician/home_page_technician.dart';
import 'package:fixify_app/pages/splashscreen/splashscreen_page.dart';
import 'package:get/get.dart';

import '../pages/home/home/profile/edit_profile_customer.dart';
import '../pages/home/home/services/service_detail_page.dart';
import '../pages/home/home/services/sub_services_page.dart';
import '../pages/home/home/technician_info/specific_service_all_technician_info.dart';
import '../pages/home/home/technician_info/technician_info_page_customer.dart';

class RouteHelper {
  //Splash Screen
  static String splashScreen = '/splash-screen';

  //Auth
  static String authPage = '/auth-page';

  //Customer
  static String homePage = '/home-customer';
  static String technicianInfoPageCustomer = '/tech-info-customer';
  static String specificServiceAllTechnicianInfo =
      '/specific-service-all-technician-info-customer';
  static String subServicesPage = '/sub-service-page';
  static String serviceDetailPage = '/services-detail-page';
  static String editProfileCustomer = '/edit-profile-customer';
  static String hiringsPage = '/hirings-page';
  static String hiringDetailInfoCustomer = '/hirings-detail-info-customer';

  //Technician
  static String homePageTechnician = '/home-technician';
  static String viewProfileTechnician = '/view-profile-technician';
  static String editProfileTechnician = '/edit-profile-technician';
  static String viewAllJobRequestsTechnician =
      '/view-all-job-requests-technician';
  static String viewJobDetailsPageTechnician =
      '/view-job-details-page-technician';

  //Notification
  static String notificationPage = '/notification-page';

  //Initial
  static String getSplashScreen() => splashScreen;

  static String getAuthPage() => authPage;

  //Customer
  static String getHomePage() => homePage;

  static String getTechnicianInfoPageCustomer(String uid) =>
      '$technicianInfoPageCustomer?uid=$uid';

  static String getSpecificServiceAllTechnicianInfo(String serviceName) =>
      '$specificServiceAllTechnicianInfo?serviceName=$serviceName';

  static String getSubServicesPage(String uid) => '$subServicesPage?uid=$uid';

  static String getServiceDetailPage(
          {required String index, required String uid}) =>
      '$serviceDetailPage?index=$index&uid=$uid';

  static String getEditProfileCustomer(String uid) =>
      '$editProfileCustomer?uid=$uid';

  static String getHiringsPage() => hiringsPage;

  static String getHiringDetailInfoCustomer(String jobId) =>
      '$hiringDetailInfoCustomer?jobId=$jobId';

  //Technician
  static String getHomeTechnician() => homePageTechnician;

  static String getViewProfileTechnician() => viewProfileTechnician;

  static String getEditProfileTechnician(String uid) =>
      '$editProfileTechnician?uid=$uid';

  static String getViewAllJobRequestsTechnician(
          {required String technicianUid}) =>
      '$viewAllJobRequestsTechnician?technicianUid=$technicianUid';

  static String getViewJobDetailsPageTechnician(String jobId) =>
      '$viewJobDetailsPageTechnician?jobId=$jobId';

  //Notification
  static String getNotificationPage() => notificationPage;

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        transition: Transition.fadeIn,
        page: () => const SplashScreen()),
    GetPage(
        name: authPage,
        transition: Transition.cupertino,
        page: () => const AuthPage()),

    //Customer
    GetPage(
        name: homePage,
        transition: Transition.cupertino,
        page: () => const HomePage()),

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
          var technicianUid = Get.parameters['uid']!;
          return TechnicianInfoPageCustomer(
            technicianUid: technicianUid,
          );
        }),

    GetPage(
        name: editProfileCustomer,
        transition: Transition.cupertino,
        page: () {
          var uid = Get.parameters['uid']!;
          return EditProfileCustomer(
            uid: uid,
          );
        }),

    GetPage(
        name: hiringsPage,
        transition: Transition.cupertino,
        page: () => const HiringsPage()),

    GetPage(
        name: hiringDetailInfoCustomer,
        transition: Transition.cupertino,
        page: () {
          var jobId = Get.parameters['jobId']!;
          return HiringDetailInfoCustomer(
            jobId: jobId,
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

    GetPage(
        name: viewAllJobRequestsTechnician,
        transition: Transition.cupertino,
        page: () {
          var technicianUid = Get.parameters['technicianUid']!;
          return ViewAllJobRequestsTechnician(
            technicianUid: technicianUid,
          );
        }),

    GetPage(
        name: viewJobDetailsPageTechnician,
        transition: Transition.cupertino,
        page: () {
          var jobId = Get.parameters['jobId']!;
          return JobDetailsPageTechnician(
            jobId: jobId,
          );
        }),

    //Notification
    GetPage(
        name: notificationPage,
        page: () {
          return const NotificationPage();
        })
  ];
}
