import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/base/show_custom_snackbar.dart';
import 'package:fixify_app/routes/route_helper.dart';
import 'package:fixify_app/utils/app_constans.dart';
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
        await preferences.setString(AppConstants.preferenceUid, userUid);

        if (userRole == 'customer') {
          Get.offAllNamed(RouteHelper.getHomePage());
        } else if (userRole == 'technician') {
          Get.offAllNamed(RouteHelper.getHomeTechnician());
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
          Get.offAllNamed(RouteHelper.getHomeTechnician());
        }
        return true;
      } else {
        showCustomSnackBar('User not found!', title: 'Error');
      }
    }
    return false;
  }
}
