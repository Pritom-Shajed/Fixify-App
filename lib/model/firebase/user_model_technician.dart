import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelTechnician {
  String? userRole;
  String? profilePic;
  String? fullName;
  String? nickName;
  String? nidNumber;
  String? password;
  String? email;
  String? uid;
  String? joinedDate;
  String? phoneNumber;
  String? division;
  String? preferredArea;
  List<dynamic>? services;
  List<dynamic>? workDays;
  int? worksDone;
  String? time1;
  String? time2;

  UserModelTechnician({
    this.userRole,
    this.profilePic,
    this.fullName,
    this.nickName,
    this.nidNumber,
    this.password,
    this.email,
    this.uid,
    this.joinedDate,
    this.phoneNumber,
    this.division,
    this.preferredArea,
    this.services,
    this.workDays,
    this.worksDone,
    this.time1,
    this.time2,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userRole': userRole,
      'profilePic': profilePic,
      'joinedDate': joinedDate,
      'fullName': fullName,
      'nickName': nickName!.toUpperCase(),
      'nid': nidNumber,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'division': division,
      'preferredArea': preferredArea,
      'services': services,
      'workDays': workDays,
      'worksDone': worksDone,
      'time1': time1,
      'time2': time2,
    };
  }

  static UserModelTechnician fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return UserModelTechnician(
      uid: data['uid'],
      userRole: data['userRole'],
      profilePic: data['profilePic'],
      joinedDate: data['joinedDate'],
      fullName: data['fullName'],
      nickName: data['nickName'],
      nidNumber: data['nid'],
      email: data['email'],
      password: data['password'],
      phoneNumber: data['phoneNumber'],
      division: data['division'],
      preferredArea: data['preferredArea'],
      services: data['services'],
      workDays: data['workDays'],
      worksDone: data['worksDone'],
      time1: data['time1'],
      time2: data['time2'],
    );
  }
}
