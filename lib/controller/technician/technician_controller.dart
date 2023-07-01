import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/model/firebase/user_model_technician.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnicianPageController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserModelTechnician? userInfoTechnician;

  Future<void> fetchTechnicianUserInfo() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    final uid = _preferences.getString('uid');
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(uid).get();

      if (snapshot.exists) {
        final userData = snapshot.data();

        userInfoTechnician = UserModelTechnician(
            userRole: userData!['userRole'],
            profilePic: userData['profilePic'],
            fullName: userData['fullName'],
            nickName: userData['nickName'],
            nidNumber: userData['nid'],
            password: userData['password'],
            email: userData['email'],
            uid: userData['uid'],
            joinedDate: userData['joinedDate'],
            phoneNumber: userData['phoneNumber'],
            division: userData['division'],
            preferredArea: userData['preferredArea'],
            services: (userData['services'] as List<dynamic>).cast<String>(),
            workDays: (userData['workDays'] as List<dynamic>).cast<String>(),
            worksDone: userData['worksDone'],
            time1: userData['time1'],
            time2: userData['time2']);

        update();
      } else {
        showCustomSnackBar('Kindly login in again', title: 'Error');
      }
    } catch (e) {
      print(e.toString());
      showCustomSnackBar(e.toString(), title: 'Error');
    }
  }
}
