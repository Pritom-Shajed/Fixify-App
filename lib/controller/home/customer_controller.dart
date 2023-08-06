import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixify_app/base/show_custom_loader.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/model/firebase/user_model_customer.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/app_constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class CustomerController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferences sharedPreferences;
  File? customerProfilePic;
  String? imageName;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CustomerController({required this.sharedPreferences});

  Future<void> pickImage(ImageSource src) async {
    XFile? xfile = await ImagePicker().pickImage(source: src);
    if (xfile != null) {
      customerProfilePic = File(xfile.path);
      imageName = path.basename(customerProfilePic!.path);
      update();
    }
  }

  UserModelCustomer? userInfoCustomer;

  Future<void> fetchCustomerUserInfo() async {
    var uid = sharedPreferences.getString(AppConstants.preferenceUid);

    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(uid).get();

      if (snapshot.exists) {
        final userData = snapshot.data();

        userInfoCustomer = UserModelCustomer(
          userRole: userData!['userRole'],
          profilePic: userData['profilePic'],
          fullName: userData['fullName'],
          uname: userData['uname'],
          password: userData['password'],
          email: userData['email'],
          uid: userData['uid'],
          joinedDate: userData['joinedDate'],
          phoneNumber: userData['phoneNumber'],
        );

        update();
      } else {
        showCustomSnackBar('Kindly login in again', title: 'Error');
      }
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }

  Future<void> updateCustomerUserInfo(
      String uid,
      BuildContext context, {
        required String fullName,
        required String uname,
        required String phoneNumber,
      }) async {
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
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
        'fullName': fullName,
        'uname': uname,
        'phoneNumber': phoneNumber,
      });
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }

  Future<void> updateCustomerProfilePicture(
      String uid, BuildContext context) async {
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
          .child('customer_$uid');

      TaskSnapshot taskSnapshot = await ref.putFile(customerProfilePic!);

      String profilePicUrl = await taskSnapshot.ref.getDownloadURL();

      userInfoCustomer!.profilePic = profilePicUrl;
      customerProfilePic = null;
      update();

      await _firestore
          .collection('users')
          .doc(uid)
          .update({'profilePic': profilePicUrl})
          .then((value) => Get.back())
          .then((value) => Get.back())
          .then((value) => Get.back())
          .then((value) => showCustomSnackBar(
              'Profile Picture Successfully Updated',
              title: 'Updated'));
    } catch (e) {
      showCustomSnackBar(isError: true, e.toString(), title: 'Error');
    }
  }


}
