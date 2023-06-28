import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/base/show_default_snackbar2.dart';
import 'package:fixify_app/model/firebase/user_model_customer.dart';
import 'package:fixify_app/model/firebase/user_model_technician.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AuthSignUpController extends GetxController {
  final _obscureTextSignUp = true.obs;
  File? authSignupImage;

  final _authSignUpError = false.obs;

  get obscureTextSignUp => _obscureTextSignUp.value;

  get authSignUpError => _authSignUpError.value;

  set obscureTextSignUp(value) {
    _obscureTextSignUp.value = value;
  }

  set authSignUpError(value) {
    _authSignUpError.value = value;
  }

  pickImage(ImageSource src) async {
    XFile? xfile = await ImagePicker().pickImage(source: src);
    if (xfile != null) {
      authSignupImage = File(xfile.path);
      update();
    }
  }

  changeObscureTextSignUp() {
    obscureTextSignUp = !obscureTextSignUp;
    update();
  }

  authSignUpErrorOccured() {
    authSignUpError = true;
    update();
  }

  authSignUpErrorCleared() {
    authSignUpError = false;
    update();
  }

  signUpCustomer({
    required BuildContext context,
    required String userRole,
    required String fullName,
    required String uname,
    required String email,
    required String pass,
    required String phoneNumber,
  }) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ),
            );
          });
      final uid = const Uuid().v4();

      //Upload Image
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile-pic')
          .child('${userRole}_$uid');

      TaskSnapshot taskSnapshot = await ref.putFile(authSignupImage!);

      String profilePicUrl = await taskSnapshot.ref.getDownloadURL();


      //Storing information's
      UserModelCustomer user = UserModelCustomer(
          uid: uid,
          userRole: userRole,
          fullName: fullName,
          uname: uname,
          email: email,
          profilePic: profilePicUrl,
          joinedDate: currentDate,
          phoneNumber: phoneNumber,
          password: pass);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(user.toJson())
          .then((value) => showCustomSnackBar('Sign in with your credential',
              title: 'Account Registered'))
          .then((value) => Get.offAllNamed(RouteHelper.getAuthPage()));
    } catch (e) {
      showDefaultSnackBar('Please try again after some time', context);
      print(e);
    }
  }

  signUpTechnician({
    required BuildContext context,
    required String userRole,
    required String fullName,
    required String uname,
    required String nidNumber,
    required String email,
    required String pass,
    required String phoneNumber,
    required String division,
    required String location,
    required List<String> services,
    required List<String> availableDays,
    required String time1,
    required String time2,
  }) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ),
            );
          });
      final uid = const Uuid().v4();

      //Upload Image
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile-pic')
          .child('${userRole}_$uid');

      TaskSnapshot taskSnapshot = await ref.putFile(authSignupImage!);

      String profilePicUrl = await taskSnapshot.ref.getDownloadURL();


      UserModelTechnician user = UserModelTechnician(
          uid: uid,
          userRole: userRole,
          fullName: fullName,
          uname: uname,
          email: email,
          profilePic: profilePicUrl,
          joinedDate: currentDate,
          phoneNumber: phoneNumber,
          password: pass,
          nidNumber: nidNumber,
          division: division,
          location: location,
          services: services,
          availableDays: availableDays,
          time1: time1,
          time2: time2,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(user.toJson())
          .then((value) => showCustomSnackBar('Sign in with your credential',
              title: 'Account Registered'))
          .then((value) => Get.offAllNamed(RouteHelper.getAuthPage()));
    } catch (e) {
      showDefaultSnackBar('Please try again after some time', context);
      print(e);
    }
  }
}
