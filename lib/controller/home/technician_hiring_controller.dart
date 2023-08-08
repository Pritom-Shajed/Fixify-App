import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/model/firebase/technician_hiring_model.dart';
import 'package:fixify_app/model/firebase/user_model_customer.dart';
import 'package:fixify_app/model/firebase/user_model_technician.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class TechnicianHiringController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _hireTextController = TextEditingController().obs;

  UserModelTechnician? userInfoTechnician;
  UserModelCustomer? userInfoCustomer;


  get hireTextController => _hireTextController.value;
  set hireTextController (value){
    _hireTextController.value = value;
  }

  List<TechnicianHiringModel> allJobRequests = [];

  Future<void> fetchJobRequests() async {
    try {

     final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('hirings').get();


      if(snapshot.docs.isNotEmpty){
        for(var orders in snapshot.docs){
          allJobRequests.add(TechnicianHiringModel.fromSnap(orders));
        }
      }

      update();

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> hireRequestTechnician({
    required BuildContext context,
    required String technicianUid,
    required String customerUid,
    required List<String> serviceName,
    required String status,
  }) async {
    try {

      EasyLoading.show(status: 'Sending request...');

      final uid = const Uuid().v4();


      TechnicianHiringModel user = TechnicianHiringModel(
        id: uid,
        technicianUid: technicianUid,
        customerUid : customerUid,
        jobDescription: hireTextController.text,
        serviceName: serviceName,
        status: status,
      );

      await FirebaseFirestore.instance
          .collection('hirings')
          .doc(uid)
          .set(user.toSnap())
          .then((value) => showCustomSnackBar('Wait for him to response',
          title: 'Requested Sent'));

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showDefaultSnackBar('Please try again after some time', context);
      throw Exception(e.toString());
    }
  }


  Future<void> fetchSpecificTechnicianInfo(String uid) async{
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('users').doc(uid).get();

      if(snapshot.exists) {
        final userData =  snapshot.data();

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
            time2: userData['time2']
        );

        update();
      } else {
        showCustomSnackBar('Technician not found', title: 'Error');
      }
    } catch(e){
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }

  Future<void> fetchSpecificCustomerInfo(String uid) async{
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('users').doc(uid).get();

      if(snapshot.exists) {
        final userData =  snapshot.data();
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

      } else {
        showCustomSnackBar('Customer not found', title: 'Error');
      }
    } catch(e){
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }
}