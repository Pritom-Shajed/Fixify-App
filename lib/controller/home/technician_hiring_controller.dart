import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/base/show_default_snackbar.dart';
import 'package:fixify_app/model/firebase/technician_hiring_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class TechnicianHiringController extends GetxController {

  final _hireTextController = TextEditingController().obs;


  get hireTextController => _hireTextController.value;
  set hireTextController (value){
    _hireTextController.value = value;
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
        technicianUid: technicianUid,
        customerUid : customerUid,
        jobDescription: hireTextController.text,
        serviceName: serviceName,
        status: status,
      );

      await FirebaseFirestore.instance
          .collection('orders')
          .doc(uid)
          .set(user.toJson())
          .then((value) => showCustomSnackBar('Wait for him to response',
          title: 'Requested Sent'));

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      showDefaultSnackBar('Please try again after some time', context);
      throw Exception(e.toString());
    }
  }
}