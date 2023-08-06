import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixify_app/base/show_custom_loader.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/model/firebase/user_model_technician.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class TechnicianPageController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferences preferences;
  File? technicianProfilePic;
  String? imageName;

  TechnicianPageController({required this.preferences});

  Future<void> pickImage(ImageSource src) async {
    XFile? xfile = await ImagePicker().pickImage(source: src);
    if (xfile != null) {
      technicianProfilePic = File(xfile.path);
      imageName = path.basename(technicianProfilePic!.path);
      update();
    }
  }

  UserModelTechnician? userInfoTechnician;

  Future<void> fetchTechnicianUserInfo() async {
    final uid = preferences.getString('uid');
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
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());

    }
  }

  Future<void> updateTechnicianProfilePicture(String uid, BuildContext context) async{
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Center(
              child:
              Center(child: showCustomLoader(color: AppColors.whiteColor)),
            );
          });
      //Upload Image
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile-pic')
          .child('technician_$uid');

      TaskSnapshot taskSnapshot = await ref.putFile(technicianProfilePic!);

      String profilePicUrl = await taskSnapshot.ref.getDownloadURL();

      userInfoTechnician!.profilePic = profilePicUrl;
      technicianProfilePic = null;
      update();

      await _firestore.collection('users').doc(uid).update({'profilePic': profilePicUrl}).then((value) => Get.back())
          .then((value) => Get.back()).then((value) => Get.back())
          .then((value) => showCustomSnackBar('Profile Picture Successfully Updated',
          title: 'Updated'));
    } catch (e){
      showCustomSnackBar(isError: true,e.toString(), title: 'Error');
    }


  }

  Future<void> updateTechnicianUserInfo(String uid, BuildContext context,
      {required String fullName,
      required String nickName,
      required String phoneNumber,
      required String division,
      required String preferredArea,
      required List services,
      required List workDays,
      required String time1,
      required String time2}) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Center(
              child:
                  Center(child: showCustomLoader(color: AppColors.whiteColor)),
            );
          });
      userInfoTechnician!.fullName = fullName;
      userInfoTechnician!.nickName = nickName.toUpperCase();
      userInfoTechnician!.phoneNumber = phoneNumber;
      userInfoTechnician!.division = division;
      userInfoTechnician!.preferredArea = preferredArea;
      userInfoTechnician!.services = services.cast<String>();
      userInfoTechnician!.workDays = workDays.cast<String>();
      userInfoTechnician!.time1 = time1;
      userInfoTechnician!.time2 = time2;
      update();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
            'fullName': fullName,
            'nickName': nickName.toUpperCase(),
            'phoneNumber': phoneNumber,
            'division': division,
            'preferredArea': preferredArea,
            'services': services,
            'workDays': workDays,
            'time1': time1,
            'time2': time2,
          })
          .then((value) => Get.back())
          .then((value) => Get.back())
          .then((value) => showCustomSnackBar('Profile Updated Successfully',
              title: 'Updated'));
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }
}
