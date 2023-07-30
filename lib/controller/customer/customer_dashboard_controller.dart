import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/model/firebase/services_model.dart';
import 'package:fixify_app/model/firebase/user_model_technician.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerDashboardController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferences sharedPreferences;

  List<UserModelTechnician> technicianInfo = [];
  List<ServicesModel> allServices = [];

  CustomerDashboardController({required this.sharedPreferences});

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
          .where('userRole', isEqualTo: 'technician')
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (var element in snapshot.docs) {
          technicianInfo.add(UserModelTechnician.fromSnap(element));
        }

        update();
      } else {
        showCustomSnackBar('Failed to fetch technician\'s info',
            title: 'Error');
      }
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }

  Future<void> fetchAllServices() async {
    allServices = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('services').get();

      print(snapshot.docs.length);




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
        showCustomSnackBar('Failed to fetch services info', title: 'Error');
      }
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }
}
