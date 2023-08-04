import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.sharedPreferences});

  bool userLoggedIn() {
    return  sharedPreferences.containsKey('uid');
  }

  Future<String> getUid() async{
    return sharedPreferences.getString('uid')??"None";
  }

  saveUid(String uid) async{
    return await sharedPreferences.setString('uid', uid);
  }



  bool clearSharedData(){

    sharedPreferences.remove('uid');

    return true;
  }
}