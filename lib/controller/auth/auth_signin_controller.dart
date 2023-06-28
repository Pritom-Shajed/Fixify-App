import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/pages/home/customer/home_page_customer.dart';
import 'package:fixify_app/pages/home/technician/home_page_technician.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthSignInController extends GetxController {
  final _obscureTextSignIn = true.obs;

  final _authSignInError = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  get obscureTextSignIn => _obscureTextSignIn.value;


  get authSignInError => _authSignInError.value;

  set obscureTextSignIn(value) {
    _obscureTextSignIn.value = value;
  }



  set authSignInError(value){
    _authSignInError.value = value;
  }


  changeObscureTextSignIn() {
    obscureTextSignIn = !obscureTextSignIn;
    update();
  }


  authSignInErrorOccured() {
    authSignInError = true;
    update();
  }

  authSignInErrorCleared() {
    authSignInError = false;
    update();
  }

  Future<void> login(String email, String password) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();


      if (snapshot.docs.isNotEmpty) {
        // Login successful, retrieve the user data
        final userData = snapshot.docs.first.data();
        final userRole = userData['userRole'];


        // Navigate to the appropriate screen based on user role
        if (userRole == 'customer') {
          Get.to(()=> HomePageCustomer());
        } else if (userRole == 'technician') {
          Get.to(()=> HomePageTechnician());
        }
      } else {
        // Login failed, handle invalid credentials or user not found
      }
    } catch (e) {
      // Handle any potential errors
    }
  }

}
