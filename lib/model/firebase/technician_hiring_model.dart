import 'package:cloud_firestore/cloud_firestore.dart';

class TechnicianHiringModel {
  String? technicianUid;
  String? customerUid;
  String? jobDescription;
  List<dynamic>? serviceName;
  String? status;

  TechnicianHiringModel(
      {this.technicianUid,
      this.customerUid,
      this.jobDescription,
      this.serviceName,
      this.status});

  Map<String, dynamic> toSnap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['technician_uid'] = technicianUid;
    data['customer_uid'] = customerUid;
    data['job_description'] = jobDescription;
    data['service_name'] = serviceName;
    data['status'] = status;
    return data;
  }

  static TechnicianHiringModel fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return TechnicianHiringModel(
      technicianUid: data['technician_uid'],
      customerUid: data['customer_uid'],
      jobDescription: data['job_description'],
      serviceName: data['service_name'],
      status: data['status'],
    );
  }
}
