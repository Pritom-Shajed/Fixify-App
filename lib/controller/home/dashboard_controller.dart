import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/controller/home/technician_hiring_controller.dart';
import 'package:fixify_app/model/firebase/banner_model.dart';
import 'package:fixify_app/model/firebase/services_model.dart';
import 'package:fixify_app/model/firebase/user_model_technician.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customer_controller.dart';

class DashboardController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferences sharedPreferences;


  List<UserModelTechnician> technicianInfo = [];
  List<ServicesModel> allServices = [];
  List<BannerModel> allBanners = [];



  @override
  onInit(){
    _loadAllData();
    super.onInit();

  }


  Future<void> _loadAllData() async {
    Get.find<AuthSignOutController>().userLoggedIn()
        ? await Get.find<CustomerController>().fetchCustomerUserInfo()
        : null;
    Get.find<AuthSignOutController>().userLoggedIn()
        ? await Get.find<TechnicianHiringController>().fetchJobRequests()
        : null;
    await fetchAllTechnician();
    await fetchAllServices();
    await fetchAllBanners();
  }

  DashboardController({required this.sharedPreferences});

  String selectedDivision = 'Dhaka';

  void updateSelectedDivision(value) {
    selectedDivision = value;
    update();
  }

  Future<void> fetchAllTechnician() async {
    technicianInfo = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .where('userRole', isEqualTo: 'technician' ).where('accountStatus', isEqualTo: 'Active')
          .get();


      if (snapshot.docs.isNotEmpty) {
        for (var element in snapshot.docs) {
          technicianInfo.add(UserModelTechnician.fromSnap(element));
        }

        update();
      }
    } catch (e) {

      throw Exception('Error while fetching banners, Error: $e');
    }
  }

  Future<void> fetchAllServices() async {
    allServices = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('services').get();


      if (snapshot.docs.isNotEmpty) {

        // // Convert the QuerySnapshot to a list of maps
        List<Map<String, dynamic>> data =
        snapshot.docs.map((doc) => doc.data()).toList();

        // Convert the list of maps to a JSON string
        String jsonData = jsonEncode(data);


        List<dynamic> jsonList = json.decode(jsonData);

        allServices = jsonList.map((json) => ServicesModel.fromJson(json)).toList();

        update();

      } else {
        showCustomSnackBar('No services found', title: 'Error');
      }
    } catch (e) {
      throw Exception('Error while fetching services, Error: $e');
    }
  }

  Future<void> fetchAllBanners () async{
    allBanners = [];
    try {
      final banners = await _firestore.collection('banners').get();


      if (banners.docs.isNotEmpty) {

        // // Convert the QuerySnapshot to a list of maps
        List<Map<String, dynamic>> data =
        banners.docs.map((doc) => doc.data()).toList();

        // Convert the list of maps to a JSON string
        String jsonData = jsonEncode(data);


        List<dynamic> jsonList = json.decode(jsonData);

        allBanners = jsonList.map((json) => BannerModel.fromJson(json)).toList();

        update();

      }

    } catch (e) {

      throw Exception('Error while fetching banners, Error: $e');
    }
  }
}
