import 'package:cloud_firestore/cloud_firestore.dart';

class TechnicianHiringModel {
  String? id;
  String? technicianUid;
  String? customerUid;
  String? jobDescription;
  List<dynamic>? serviceName;
  String? status;
  dynamic price;
  dynamic lastUpdated;

  TechnicianHiringModel(
      {
        this.id,
        this.technicianUid,
      this.customerUid,
      this.jobDescription,
      this.serviceName,
      this.status,
      this.price, this.lastUpdated});

  Map<String, dynamic> toSnap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['technician_uid'] = technicianUid;
    data['customer_uid'] = customerUid;
    data['job_description'] = jobDescription;
    data['service_name'] = serviceName;
    data['status'] = status;
    data['price'] = price;
    data['last_updated'] = lastUpdated;
    return data;
  }

  static TechnicianHiringModel fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return TechnicianHiringModel(
      id: data['id'],
      technicianUid: data['technician_uid'],
      customerUid: data['customer_uid'],
      jobDescription: data['job_description'],
      serviceName: data['service_name'],
      status: data['status'],
      price: data['price'],
      lastUpdated: data['last_updated']
    );
  }
}
