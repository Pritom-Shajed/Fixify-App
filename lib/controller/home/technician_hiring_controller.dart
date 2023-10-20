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

  final _hiringPriceController = TextEditingController().obs;

  get hiringPriceController => _hiringPriceController.value;

  set hiringPriceController(value) {
    _hiringPriceController.value = value;
  }

  get hireTextController => _hireTextController.value;

  set hireTextController(value) {
    _hireTextController.value = value;
  }

  Future<void> updateHiringPriceTextEditingController(String price) async {
    hiringPriceController = TextEditingController(text: price);
  }

  List<TechnicianHiringModel> allJobRequests = [];

  Future<void> fetchJobRequests() async {
    allJobRequests = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('hirings').get();

      if (snapshot.docs.isNotEmpty) {
        for (var orders in snapshot.docs) {
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
        customerUid: customerUid,
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

  Future<void> updateHiringPrice(
      {required String jobId, required bool isCustomer,     required String technicianUid,
        required String customerUid,}) async {
    EasyLoading.show(status: 'Updating price...');
    try {
      Map<String, dynamic> body = {
        'price': hiringPriceController.text,
        'last_updated': isCustomer ? 'customer' : 'technician'
      };

      await FirebaseFirestore.instance
          .collection('hirings')
          .doc(jobId)
          .update(body);

      Map<String, dynamic> notificationBody = {
        'technicianId': technicianUid,
        'customerId': customerUid,
        'description': 'Updated the price to ${hiringPriceController.text}'
      };

      await FirebaseFirestore.instance
          .collection('notification')
          .doc(jobId)
          .set(notificationBody)
          .whenComplete(() => showCustomSnackBar('Wait for him to response',
              title: 'Price updated'));

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showCustomSnackBar('Please try again after sometime');
      throw Exception(e.toString());
    }
  }

  Future<void> acceptOrRejectOffer(
      {required String jobId, required bool isAccepted,    required String technicianUid,
        required String customerUid,}) async {
    EasyLoading.show(
        status: isAccepted ? 'Confirming Offer' : 'Rejecting Offer');
    try {
      Map<String, dynamic> body = {
        'status': isAccepted ? 'confirmed' : 'rejected'
      };

      await FirebaseFirestore.instance
          .collection('hirings')
          .doc(jobId)
          .update(body)
          .whenComplete(() => isAccepted
              ? showCustomSnackBar('Technician successfully hired',
                  title: 'Confirmed')
              : showCustomSnackBar('Offer rejected', title: 'Rejected'));

      Map<String, dynamic> notificationBody = {
        'technicianId': technicianUid,
        'customerId': customerUid,
        'description': isAccepted ? 'Appointment placed' : 'Appointment rejected'
      };

      await FirebaseFirestore.instance
          .collection('notification')
          .doc(jobId)
          .set(notificationBody)
          .whenComplete(() => showCustomSnackBar('Wait for him to response',
          title: 'Price updated'));

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();

      showCustomSnackBar('Please try again after sometime');
      throw Exception(e.toString());
    }
  }

  Future<void> fetchSpecificTechnicianInfo(String uid) async {
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
        showCustomSnackBar('Technician not found', title: 'Error');
      }
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }

  Future<void> fetchSpecificCustomerInfo(String uid) async {
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
      } else {
        showCustomSnackBar('Customer not found', title: 'Error');
      }
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error');
      throw Exception(e.toString());
    }
  }
}
