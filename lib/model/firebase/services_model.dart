import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesFirebaseModel{
  String? name;
  String? icon;

  ServicesFirebaseModel({this.name, this.icon});

  static ServicesFirebaseModel fromSnap(DocumentSnapshot snap){
    var data = snap.data() as Map<String, dynamic>;
    return ServicesFirebaseModel(
      name: data['name'],
      icon: data['icon']
    );
  }
}