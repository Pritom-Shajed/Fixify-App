import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  String? technicianUid;
  String? customerUid;
  String? description;

  NotificationsModel(
      {
        this.technicianUid,
        this.customerUid,
        this.description});

  Map<String, dynamic> toSnap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['technicianId'] = technicianUid;
    data['customerId'] = customerUid;
    data['description'] = description;
    return data;
  }

  static NotificationsModel fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return NotificationsModel(
        technicianUid: data['technicianId'],
        customerUid: data['customerId'],
        description: data['description'],
    );
  }
}
