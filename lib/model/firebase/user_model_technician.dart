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
    required this.userRole,
    required this.profilePic,
    required this.fullName,
    required this.nickName,
    required this.nidNumber,
    required this.password,
    required this.email,
    required this.uid,
    required this.joinedDate,
    required this.phoneNumber,
    required this.division,
    required this.preferredArea,
    required this.services,
    required this.workDays,
    required this.worksDone,
    required this.time1,
    required this.time2,
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
