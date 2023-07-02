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
  List<String>? services;
  List<String>? workDays;
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

  // static UserModelTechnician fromSnap(DocumentSnapshot snap) {
  //   var data = snap.data() as Map<String, dynamic>;
  //   return UserModelTechnician(
  //     uid: data['uid'],
  //     userRole: data['userRole'],
  //     profilePic: data['profilePic'],
  //     joinedDate: data['joinedDate'],
  //     fullName: data['fullName'],
  //     uname: data['name'],
  //     email: data['email'],
  //     password: data['password'],
  //     phoneNumber: data['phoneNumber'],
  //   );
  // }
}
