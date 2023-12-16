import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/base/show_custom_toast.dart';
import 'package:fixify_app/controller/auth/auth_signout_controller.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_constans.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSignInController extends GetxController {
  final _obscureTextSignIn = true.obs;

  final _authSignInError = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferences preferences;

  AuthSignInController({required this.preferences});

  get obscureTextSignIn => _obscureTextSignIn.value;

  get authSignInError => _authSignInError.value;

  set obscureTextSignIn(value) {
    _obscureTextSignIn.value = value;
  }

  set authSignInError(value) {
    _authSignInError.value = value;
  }

  changeObscureTextSignIn() {
    obscureTextSignIn = !obscureTextSignIn;
    update();
  }

  authSignInErrorOccured() {
    authSignInError = true;
    update();
  }

  authSignInErrorCleared() {
    authSignInError = false;
    update();
  }

  Future<void> login(String email, String password) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Login successful, retrieve the user data
        final userData = snapshot.docs.first.data();
        final userRole = userData['userRole'];
        final userUid = userData['uid'];


        if (userRole == 'customer') {
          await preferences.setString(AppConstants.preferenceUid, userUid);
          Get.offAllNamed(RouteHelper.getSplashScreen());

        } else if (userRole == 'technician') {

          if(userData['accountStatus'] == 'Active'){
            await preferences.setString(AppConstants.preferenceUid, userUid);
            Get.offNamedUntil(RouteHelper.getHomeTechnician(), (route) => route.isFirst);
          } else if(userData['accountStatus'] == 'Suspended') {
            showCustomToast('Your account has been suspended!', toastLength: Toast.LENGTH_LONG);
          } else {
            showCustomToast('Wait until you account is activated', toastLength: Toast.LENGTH_LONG);
          }
        }
      } else {
        showCustomSnackBar('Invalid credential provided', title: 'Error');
      }
    } catch (e) {
      showCustomSnackBar(e.toString(), title: 'Error', isError: true);
    }
  }

  Future<bool> checkLoginStatus() async {

    final userId = preferences.getString(AppConstants.preferenceUid);
    if (userId != null) {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(userId).get();

      if (snapshot.exists) {
        final userData = snapshot.data();
        if (userData!['userRole'] == 'customer') {
          Get.offAllNamed(RouteHelper.getHomePage());
        } else if (userData['userRole'] == 'technician') {
          if(userData['accountStatus'] == 'Active'){
            Get.offAllNamed(RouteHelper.getHomeTechnician());
          } else {
            await Get.find<AuthSignOutController>().clearSharedData();
            showCustomToast('Your account has been suspended!', toastLength: Toast.LENGTH_LONG);
            Get.offAllNamed(RouteHelper.getHomePage());

          }

        }
        return true;
      } else {
        showCustomSnackBar('User not found!', title: 'Error');
      }
    }
    return false;
  }
}
