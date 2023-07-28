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
  List<ServicesFirebaseModel> allServices = [];

  CustomerDashboardController({required this.sharedPreferences});

   String selectedDivision = 'Dhaka';

  void updateSelectedDivision ( value){
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
        showCustomSnackBar('Failed to fetch technician\'s info', title: 'Error');
      }
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }

  Future<void> fetchAllServices () async{
    allServices = [];
    try {

      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('services').get();


      if (snapshot.docs.isNotEmpty) {

        for (var element in snapshot.docs) {
          allServices.add(ServicesFirebaseModel.fromSnap(element));
        }

        update();



      } else {
        showCustomSnackBar('Failed to fetch technician\'s info', title: 'Error');
      }
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }
}