import 'package:fixify_app/utils/app_constans.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSignOutController extends GetxController {
  final SharedPreferences preferences;

  AuthSignOutController({required this.preferences});

  bool userLoggedIn() {
    return  preferences.containsKey(AppConstants.preferenceUid);
  }


  Future<bool> clearSharedData() async{

    await preferences.remove(AppConstants.preferenceUid);

    return true;
  }

}
